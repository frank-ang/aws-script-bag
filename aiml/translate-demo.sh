INPUT_TEXT="您好世界"
INPUT_LANGUAGE="zh"
OUTPUT_LANGUAGE="en"
OUTPUT_DIR="tmp.gitignore"
mkdir -p "$OUTPUT_DIR"
# Generate input speech

# AWS CLI does not support streaming. 
# TODO: try the Transcribe Java SDK FOR HTTP/2 retry client.

# Sample data stuff
#aws polly synthesize-speech --language-code "cmn-CN" --output-format mp3 \
#    --text "$INPUT_TEXT" --voice-id Zhiyu input.mp3

# Translate
TRANSLATED_TEXT=`aws translate translate-text --text $INPUT_TEXT --source-language-code $INPUT_LANGUAGE --target-language-code $OUTPUT_LANGUAGE --query "TranslatedText" --output text`
echo $TRANSLATED_TEXT

# Generate Output Speech.
OUTPUT_FILENAME="$OUTPUT_DIR/demo.mp3"
aws polly synthesize-speech --language-code "us-EN" --output-format mp3 \
    --text "$INPUT_TEXT" --voice-id Zhiyu $OUTPUT_FILENAME