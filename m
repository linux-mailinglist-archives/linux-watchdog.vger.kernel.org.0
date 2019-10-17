Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 28EA8DADD9
	for <lists+linux-watchdog@lfdr.de>; Thu, 17 Oct 2019 15:07:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394192AbfJQNHE (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 17 Oct 2019 09:07:04 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:33672 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726898AbfJQNHE (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 17 Oct 2019 09:07:04 -0400
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id x9HD6CTL006967;
        Thu, 17 Oct 2019 15:06:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=PrKwUa1Em5v/HEpQejy1oKJW+ecJixsX/EL63AL0ouE=;
 b=Buoh9QaPNiOCjr1uMGp5mK2iuqDR2M2ydEkzjMb/85WtgxIUSHiI3qQTu3r9Za3pcIPw
 v8muvSSac2KxNBneZI1uN665atTjXoV19vYG2+wQskFvI5qnvIF0ivdzJbp/usEkj0OE
 m2+5sdpoysFLtXFSEUKtm2s0UCQ9d5qdrq+M2DApeztSMWn7cp3uACMii5MpIh0+qrc7
 0ME7j/hBRpsjYCBWo/ELtQhQtFlY3I1MqwrNUaKNNHpKb5HVmpu1R19hDAbeoRlVxVej
 LWN92nTga50Ckigy0sUENA48QoZy5SX8OWK2MgDM7Hlyp6c07iZnPR+Ah2dwW494y7MZ RQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx08-00178001.pphosted.com with ESMTP id 2vk5qjm5d8-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 17 Oct 2019 15:06:27 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 74B2D100038;
        Thu, 17 Oct 2019 15:06:26 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 58AB92B7573;
        Thu, 17 Oct 2019 15:06:26 +0200 (CEST)
Received: from lmecxl0912.lme.st.com (10.75.127.50) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Thu, 17 Oct
 2019 15:06:25 +0200
Subject: Re: [PATCH] dt-bindings: watchdog: Convert stm32 watchdog bindings to
 json-schema
To:     Benjamin Gaignard <benjamin.gaignard@st.com>,
        <wim@linux-watchdog.org>, <linux@roeck-us.net>,
        <robh+dt@kernel.org>, <mark.rutland@arm.com>
CC:     <linux-watchdog@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
References: <20191017124159.13869-1-benjamin.gaignard@st.com>
From:   Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <63f96a2f-78c0-21ae-781b-e52068f57103@st.com>
Date:   Thu, 17 Oct 2019 15:06:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191017124159.13869-1-benjamin.gaignard@st.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG5NODE2.st.com (10.75.127.14) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-17_04:2019-10-17,2019-10-17 signatures=0
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi Benjamin

On 10/17/19 2:41 PM, Benjamin Gaignard wrote:
> Convert the STM32 watchdog binding to DT schema format using json-schema
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
> ---
>   .../devicetree/bindings/watchdog/st,stm32-iwdg.txt | 26 -----------
>   .../bindings/watchdog/st,stm32-iwdg.yaml           | 54 ++++++++++++++++++++++
>   2 files changed, 54 insertions(+), 26 deletions(-)
>   delete mode 100644 Documentation/devicetree/bindings/watchdog/st,stm32-iwdg.txt
>   create mode 100644 Documentation/devicetree/bindings/watchdog/st,stm32-iwdg.yaml
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/st,stm32-iwdg.txt b/Documentation/devicetree/bindings/watchdog/st,stm32-iwdg.txt
> deleted file mode 100644
> index d8f4430b0a13..000000000000
> --- a/Documentation/devicetree/bindings/watchdog/st,stm32-iwdg.txt
> +++ /dev/null
> @@ -1,26 +0,0 @@
> -STM32 Independent WatchDoG (IWDG)
> ----------------------------------
> -
> -Required properties:
> -- compatible: Should be either:
> -  - "st,stm32-iwdg"
> -  - "st,stm32mp1-iwdg"
> -- reg: Physical base address and length of the registers set for the device
> -- clocks: Reference to the clock entry lsi. Additional pclk clock entry
> -  is required only for st,stm32mp1-iwdg.
> -- clock-names: Name of the clocks used.
> -  "lsi" for st,stm32-iwdg
> -  "lsi", "pclk" for st,stm32mp1-iwdg
> -
> -Optional Properties:
> -- timeout-sec: Watchdog timeout value in seconds.
> -
> -Example:
> -
> -iwdg: watchdog@40003000 {
> -	compatible = "st,stm32-iwdg";
> -	reg = <0x40003000 0x400>;
> -	clocks = <&clk_lsi>;
> -	clock-names = "lsi";
> -	timeout-sec = <32>;
> -};
> diff --git a/Documentation/devicetree/bindings/watchdog/st,stm32-iwdg.yaml b/Documentation/devicetree/bindings/watchdog/st,stm32-iwdg.yaml
> new file mode 100644
> index 000000000000..edec96d53e6b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/watchdog/st,stm32-iwdg.yaml
> @@ -0,0 +1,54 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/watchdog/st,stm32-iwdg.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: STMicroelectronics STM32 Independent WatchDoG (IWDG) bindings
> +
> +maintainers:
> +  - Yannick Fertre <yannick.fertre@st.com>

Yannick is still working on this driver ?

> +
> +allOf:
> +  - $ref: "watchdog.yaml#"
> +
> +properties:
> +  compatible:
> +    enum:
> +      - st,stm32-iwdg
> +      - st,stm32mp1-iwdg
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: Low speed clock
> +      - description: Optional peripheral clock
> +    minItems: 1
> +    maxItems: 2
> +
> +  clock-names:
> +    items:
> +      enums: [ lsi, pclk ]
> +    minItems: 1
> +    maxItems: 2
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/stm32mp1-clks.h>
> +    watchdog@5a002000 {
> +      compatible = "st,stm32mp1-iwdg";
> +      reg = <0x5a002000 0x400>;
> +      clocks = <&rcc IWDG2>, <&rcc CK_LSI>;
> +      clock-names = "pclk", "lsi";
> +      timeout-sec = <32>;
> +    };
> +
> +...
> 
