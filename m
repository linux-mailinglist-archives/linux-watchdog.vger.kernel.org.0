Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 158CB3A41DE
	for <lists+linux-watchdog@lfdr.de>; Fri, 11 Jun 2021 14:19:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231231AbhFKMV0 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 11 Jun 2021 08:21:26 -0400
Received: from esa.microchip.iphmx.com ([68.232.153.233]:65085 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229785AbhFKMVZ (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 11 Jun 2021 08:21:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1623413969; x=1654949969;
  h=subject:from:to:cc:references:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=CGysVqRE99O7ONXLYGm+PNGdjodr4c/+vWLCtxrIJtU=;
  b=F7UjxwQUtK0vUP2mbpZ69T9gXKYAcnrVZ3crYvaD/522IcYPp52qmLsQ
   oWRRlhTG7/+XpGWonq8bzxse8eiHP9mRvDSiHRSFSt4Z+PvTw0dkOISGY
   kVtExgca3DcWij+TBkx2Yz5fmuXKN8QvLCB99jVaS5IUN7T6UOZYQ+sVR
   iIhyexoINQvJrJ6IdTycokCodfG1zp8w0AAhPDIedbNdTTySDEq7ApM72
   ukFvU80UgdnbL7onCo7JF9ydzqAlK9hKFfU+fKYt3Yu9apVdWWme3k9sr
   dtUwvMJTEt0HUmW1xf8UG6O0DVI7SZIYyrPVS0HguNAqREybauznviaTs
   g==;
IronPort-SDR: TEGAHNpMtPdipsBvSrTlzdDBPeL61qbSFeNMyGz2lV/RxmejqHhGIH+o+2X8U+M6eNTsLugzCf
 YTYnaQHWJmr7Onvv2OLY24+8DGryqy6xiTlhAdGt8OsIEXtaeXdrHPLMQi6j5jVGauWDvqdSnS
 qJn3Jy/Nld9ivNxuPv/edPLBLJiX+r7yznjUVhiKI8AiIRI/joujSfW+4ewqqatMxPb9mcCEbC
 bv1oi4Ml9IbXgqfQbAwOEtOzABWWnBNO6eLzX1qSp597UI4Z+XQ5PDBFM/0O2QUMLHyQhwZLcm
 X0w=
X-IronPort-AV: E=Sophos;i="5.83,265,1616482800"; 
   d="scan'208";a="124394813"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 11 Jun 2021 05:19:28 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 11 Jun 2021 05:19:26 -0700
Received: from [10.12.73.132] (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2176.2 via Frontend
 Transport; Fri, 11 Jun 2021 05:19:25 -0700
Subject: Re: [PATCH 1/3] dt-bindings: watchdog: sama5d4-wdt: convert to yaml
From:   Nicolas Ferre <nicolas.ferre@microchip.com>
To:     Eugen Hristev <eugen.hristev@microchip.com>,
        <wim@linux-watchdog.org>, <linux@roeck-us.net>,
        <robh+dt@kernel.org>
CC:     <linux-watchdog@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
References: <20210527100120.266796-1-eugen.hristev@microchip.com>
 <2360b414-6a92-2952-8eec-954497f84bae@microchip.com>
Organization: microchip
Message-ID: <7656b317-2192-fe43-142f-fd507fba7a32@microchip.com>
Date:   Fri, 11 Jun 2021 14:19:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <2360b414-6a92-2952-8eec-954497f84bae@microchip.com>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 06/06/2021 at 18:52, Nicolas Ferre wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On 27/05/2021 at 12:01, Eugen Hristev wrote:
>> Convert the old txt binding to yaml format.
>>
>> Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
> 
> Series queued on at91-dt for 5.14. Will be sent to arm-soc soon.

Please ignore this comment which has no meaning as all the content of 
this series must progress with the "watchdog" tree and not at91->arm-soc!

Sorry for the noise and confusion. I'm removing the patches from at91-dt 
right now.

Best regards,
   Nicolas

>> ---
>>    .../bindings/watchdog/atmel,sama5d4-wdt.yaml  | 73 +++++++++++++++++++
>>    .../bindings/watchdog/atmel-sama5d4-wdt.txt   | 34 ---------
>>    2 files changed, 73 insertions(+), 34 deletions(-)
>>    create mode 100644 Documentation/devicetree/bindings/watchdog/atmel,sama5d4-wdt.yaml
>>    delete mode 100644 Documentation/devicetree/bindings/watchdog/atmel-sama5d4-wdt.txt
>>
>> diff --git a/Documentation/devicetree/bindings/watchdog/atmel,sama5d4-wdt.yaml b/Documentation/devicetree/bindings/watchdog/atmel,sama5d4-wdt.yaml
>> new file mode 100644
>> index 000000000000..0d0ab81da040
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/watchdog/atmel,sama5d4-wdt.yaml
>> @@ -0,0 +1,73 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/watchdog/atmel,sama5d4-wdt.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Atmel SAMA5D4 Watchdog Timer (WDT) Controller
>> +
>> +maintainers:
>> +  - Eugen Hristev <eugen.hristev@microchip.com>
>> +
>> +allOf:
>> +  - $ref: "watchdog.yaml#"
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - atmel,sama5d4-wdt
>> +      - microchip,sam9x60-wdt
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  atmel,watchdog-type:
>> +    $ref: /schemas/types.yaml#/definitions/string
>> +    description: should be hardware or software.
>> +    oneOf:
>> +      - description:
>> +          Enable watchdog fault reset. A watchdog fault triggers
>> +          watchdog reset.
>> +        const: hardware
>> +      - description:
>> +          Enable watchdog fault interrupt. A watchdog fault asserts
>> +          watchdog interrupt.
>> +        const: software
>> +    default: hardware
>> +
>> +  atmel,idle-halt:
>> +    $ref: /schemas/types.yaml#/definitions/flag
>> +    description: |
>> +      present if you want to stop the watchdog when the CPU is in idle state.
>> +      CAUTION: This property should be used with care, it actually makes the
>> +      watchdog not counting when the CPU is in idle state, therefore the
>> +      watchdog reset time depends on mean CPU usage and will not reset at all
>> +      if the CPU stop working while it is in idle state, which is probably
>> +      not what you want.
>> +
>> +  atmel,dbg-halt:
>> +    $ref: /schemas/types.yaml#/definitions/flag
>> +    description: |
>> +      present if you want to stop the watchdog when the CPU is in debug state.
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +
>> +unevaluatedProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/interrupt-controller/irq.h>
>> +
>> +    watchdog@fc068640 {
>> +      compatible = "atmel,sama5d4-wdt";
>> +      reg = <0xfc068640 0x10>;
>> +      interrupts = <4 IRQ_TYPE_LEVEL_HIGH 5>;
>> +      timeout-sec = <10>;
>> +      atmel,watchdog-type = "hardware";
>> +      atmel,dbg-halt;
>> +      atmel,idle-halt;
>> +    };
>> +
>> +...
>> diff --git a/Documentation/devicetree/bindings/watchdog/atmel-sama5d4-wdt.txt b/Documentation/devicetree/bindings/watchdog/atmel-sama5d4-wdt.txt
>> deleted file mode 100644
>> index 44727fcc2729..000000000000
>> --- a/Documentation/devicetree/bindings/watchdog/atmel-sama5d4-wdt.txt
>> +++ /dev/null
>> @@ -1,34 +0,0 @@
>> -* Atmel SAMA5D4 Watchdog Timer (WDT) Controller
>> -
>> -Required properties:
>> -- compatible: "atmel,sama5d4-wdt" or "microchip,sam9x60-wdt"
>> -- reg: base physical address and length of memory mapped region.
>> -
>> -Optional properties:
>> -- timeout-sec: watchdog timeout value (in seconds).
>> -- interrupts: interrupt number to the CPU.
>> -- atmel,watchdog-type: should be "hardware" or "software".
>> -     "hardware": enable watchdog fault reset. A watchdog fault triggers
>> -                 watchdog reset.
>> -     "software": enable watchdog fault interrupt. A watchdog fault asserts
>> -                 watchdog interrupt.
>> -- atmel,idle-halt: present if you want to stop the watchdog when the CPU is
>> -                in idle state.
>> -     CAUTION: This property should be used with care, it actually makes the
>> -     watchdog not counting when the CPU is in idle state, therefore the
>> -     watchdog reset time depends on mean CPU usage and will not reset at all
>> -     if the CPU stop working while it is in idle state, which is probably
>> -     not what you want.
>> -- atmel,dbg-halt: present if you want to stop the watchdog when the CPU is
>> -               in debug state.
>> -
>> -Example:
>> -     watchdog@fc068640 {
>> -             compatible = "atmel,sama5d4-wdt";
>> -             reg = <0xfc068640 0x10>;
>> -             interrupts = <4 IRQ_TYPE_LEVEL_HIGH 5>;
>> -             timeout-sec = <10>;
>> -             atmel,watchdog-type = "hardware";
>> -             atmel,dbg-halt;
>> -             atmel,idle-halt;
>> -     };
>>
> 
> 
> --
> Nicolas Ferre
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> 


-- 
Nicolas Ferre
