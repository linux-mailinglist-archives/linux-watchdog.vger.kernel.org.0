Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C4367E662A
	for <lists+linux-watchdog@lfdr.de>; Thu,  9 Nov 2023 10:05:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232778AbjKIJFP (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 9 Nov 2023 04:05:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229509AbjKIJFO (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 9 Nov 2023 04:05:14 -0500
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EF3EEA
        for <linux-watchdog@vger.kernel.org>; Thu,  9 Nov 2023 01:05:12 -0800 (PST)
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2c523ac38fbso7126651fa.0
        for <linux-watchdog@vger.kernel.org>; Thu, 09 Nov 2023 01:05:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699520710; x=1700125510; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EwXeCr4WJrMiVz1N0BRYm+ZyoJe1l9iKn/4uLGie6Ww=;
        b=F/HjRKf3Q8l/Yh1cq/M1U4OFXizJ6jgnreOO9qll1cC1u+ioI0MRH8IFOmSoXWdcUe
         QljWPrNDdMfHYG+FueSDyuV4lIS8lFaNBzRN9B3UM7DRdd8RkXlW+rKS4yEhoCn4MTUd
         9izyHUz/cvvY3SAzc4wdPia1fNWeHHgUb6hqgNdqiObVYBV/e8HbCziT/9CuWxhf6lO2
         GUx+A2IZm9umnpBCnecxFFZYOGFP4JyOKt8OgsGLi3q9r77mkhzdNSaASE0fUMUPiUvE
         GEaNViCgetByNEAfC3Qy0Y+bZfX8n3/3BDw40EHhKEcSTIgchbq0fUstYYditYJYMSKD
         +AyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699520710; x=1700125510;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=EwXeCr4WJrMiVz1N0BRYm+ZyoJe1l9iKn/4uLGie6Ww=;
        b=Ysis/ifWuWbhNcYmv3uPV+IIAfANJpXFMT3Zgcl+bT3B+nWD/xn4qk+hod5Fv4odjh
         IrxDM1AD33Nufq8kat08QciZom0oWc2O/WP/UJGfaX/m+xUqtzRFekHMtlf72nvNe7RQ
         YkRXDqaf3L9CWT8mIiFrve+mJ1rG9cFGIOlvtWOuqx8bI1BzslwWnVf9Yan4SfIoSg76
         M6PNnMtsOfeNe6NnF3WVvxFh2Ps/6/akRhiIuMUhbISbI/lGKnVtFDac5w9hLnIsF1l/
         wFlN0RvWpMaykXsd6CrSN6HCmYG6YTeo2dBRhI1WXvjwrT7Pej9rAuUPg/I5oEvTKM7X
         HqXg==
X-Gm-Message-State: AOJu0YxoTWshTX6dDWNHHw2cSVBvNY0ADOuIh+eeyRAnhEyEHsXfCmdg
        6lbJ74MevgoxHPmzOkOTXKZG+Q==
X-Google-Smtp-Source: AGHT+IF0tpaWBQijHfpYa1G4eCyN/CBUwGg2+EyirhnHCL+6Rn8FIHsbybgcgnceb2Re9bKtUvTxQA==
X-Received: by 2002:a2e:930d:0:b0:2bd:1000:431d with SMTP id e13-20020a2e930d000000b002bd1000431dmr3509911ljh.10.1699520680538;
        Thu, 09 Nov 2023 01:04:40 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:8f4c:8054:506f:f04b? ([2a01:e0a:982:cbb0:8f4c:8054:506f:f04b])
        by smtp.gmail.com with ESMTPSA id 17-20020a05600c229100b003fe1fe56202sm1409881wmf.33.2023.11.09.01.04.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Nov 2023 01:04:39 -0800 (PST)
Message-ID: <18960bc4-de01-4a72-855a-b8696390a4d4@linaro.org>
Date:   Thu, 9 Nov 2023 10:04:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From:   neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH V3 2/3] arm64: dts: Add watchdog node for Amlogic C3 SoCs
Content-Language: en-US, fr
To:     Huqiang Qin <huqiang.qin@amlogic.com>, wim@linux-watchdog.org,
        linux@roeck-us.net, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        khilman@baylibre.com, jbrunet@baylibre.com,
        martin.blumenstingl@googlemail.com
Cc:     linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20231027104358.342861-1-huqiang.qin@amlogic.com>
 <20231027104358.342861-3-huqiang.qin@amlogic.com>
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro Developer Services
In-Reply-To: <20231027104358.342861-3-huqiang.qin@amlogic.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 27/10/2023 12:43, Huqiang Qin wrote:
> Add watchdog device.
> 
> Signed-off-by: Huqiang Qin <huqiang.qin@amlogic.com>
> ---
>   arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi
> index 998f5050795c..2ad1f8eef199 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi
> @@ -81,6 +81,12 @@ apb4: bus@fe000000 {
>   			#size-cells = <2>;
>   			ranges = <0x0 0x0 0x0 0xfe000000 0x0 0x480000>;
>   
> +			watchdog@2100 {
> +				compatible = "amlogic,c3-wdt", "amlogic,t7-wdt";
> +				reg = <0x0 0x2100 0x0 0x10>;
> +				clocks = <&xtal>;
> +			};
> +
>   			periphs_pinctrl: pinctrl@4000 {
>   				compatible = "amlogic,c3-periphs-pinctrl";
>   				#address-cells = <2>;

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
