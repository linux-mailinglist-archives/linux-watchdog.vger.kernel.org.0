Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F506202FEC
	for <lists+linux-watchdog@lfdr.de>; Mon, 22 Jun 2020 08:46:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726704AbgFVGq0 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 22 Jun 2020 02:46:26 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:50250 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725933AbgFVGq0 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 22 Jun 2020 02:46:26 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 05M6juET037132;
        Mon, 22 Jun 2020 01:45:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1592808356;
        bh=CzFkttaRhi3JTEfc3yW2lucwElCU+YQ+OtTKPFDbd+8=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=TV4xGCpFnjxAd54nxcfg4xS7anK+kfMrUtfOPCWALgU8JXq75pmRXgFuxQbfkvnjc
         0MJEkYepa+lk5Y+ay80qE201tbRvG79jkntXoVPsLE0AeXFYCqtlw66vakucwOaXZ/
         1hVt52vzIVOVj0OggFbofvOoRUc2MH8qlreXQ1BA=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 05M6juZ7102986
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 22 Jun 2020 01:45:56 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 22
 Jun 2020 01:45:56 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 22 Jun 2020 01:45:56 -0500
Received: from [127.0.0.1] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 05M6jrhJ049545;
        Mon, 22 Jun 2020 01:45:54 -0500
Subject: Re: [PATCHv4 1/4] dt-bindings: watchdog: Add support for TI K3 RTI
 watchdog
To:     Jan Kiszka <jan.kiszka@siemens.com>, <wim@linux-watchdog.org>,
        <linux@roeck-us.net>, <linux-watchdog@vger.kernel.org>
CC:     <linux-kernel@vger.kernel.org>, Rob Herring <robh@kernel.org>,
        <devicetree@vger.kernel.org>
References: <20200312095808.19907-1-t-kristo@ti.com>
 <20200312095808.19907-2-t-kristo@ti.com>
 <d576a40f-46fb-7ad9-7bfe-11891f9867a6@siemens.com>
From:   Tero Kristo <t-kristo@ti.com>
Message-ID: <dac576e5-72a1-dfff-dbb3-9695ac0f687e@ti.com>
Date:   Mon, 22 Jun 2020 09:45:53 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <d576a40f-46fb-7ad9-7bfe-11891f9867a6@siemens.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 18/06/2020 19:09, Jan Kiszka wrote:
> On 12.03.20 10:58, Tero Kristo wrote:
>> TI K3 SoCs contain an RTI (Real Time Interrupt) module which can be
>> used to implement a windowed watchdog functionality. Windowed watchdog
>> will generate an error if it is petted outside the time window, either
>> too early or too late.
>>
>> Cc: Rob Herring <robh@kernel.org>
>> Cc: devicetree@vger.kernel.org
>> Signed-off-by: Tero Kristo <t-kristo@ti.com>
>> ---
>> v4:
>>    * changed license to dual
>>    * added documentation for missing properties
>>    * added ref to watchdog.yaml
>>    * renamed main_rti0 to watchdog0 in example
>>
>>   .../bindings/watchdog/ti,rti-wdt.yaml         | 65 +++++++++++++++++++
>>   1 file changed, 65 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/watchdog/ti,rti-wdt.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/watchdog/ti,rti-wdt.yaml b/Documentation/devicetree/bindings/watchdog/ti,rti-wdt.yaml
>> new file mode 100644
>> index 000000000000..e83026fef2e9
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/watchdog/ti,rti-wdt.yaml
>> @@ -0,0 +1,65 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/watchdog/ti,rti-wdt.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Texas Instruments K3 SoC Watchdog Timer
>> +
>> +maintainers:
>> +  - Tero Kristo <t-kristo@ti.com>
>> +
>> +description:
>> +  The TI K3 SoC watchdog timer is implemented via the RTI (Real Time
>> +  Interrupt) IP module. This timer adds a support for windowed watchdog
>> +  mode, which will signal an error if it is pinged outside the watchdog
>> +  time window, meaning either too early or too late. The error signal
>> +  generated can be routed to either interrupt a safety controller or
>> +  to directly reset the SoC.
>> +
>> +allOf:
>> +  - $ref: "watchdog.yaml#"
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - ti,j7-rti-wdt
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    maxItems: 1
>> +
>> +  power-domains:
>> +    maxItems: 1
>> +
>> +  assigned-clocks:
>> +    maxItems: 1
>> +
>> +  assigned-clocks-parents:
>> +    maxItems: 1
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - clocks
>> +  - power-domains
>> +
>> +examples:
>> +  - |
>> +    /*
>> +     * RTI WDT in main domain on J721e SoC. Assigned clocks are used to
>> +     * select the source clock for the watchdog, forcing it to tick with
>> +     * a 32kHz clock in this case.
>> +     */
>> +    #include <dt-bindings/soc/ti,sci_pm_domain.h>
>> +
>> +    watchdog0: rti@2200000 {
>> +        compatible = "ti,rti-wdt";
> 
> At some stage, you changed the compatible string to something
> J721e-specific. This one wasn't updated.

Hmm nice catch, this should be fixed. I wonder why the DT test tools did 
not catch this when I changed the compatible...

>> +        reg = <0x0 0x2200000 0x0 0x100>;
>> +        clocks = <&k3_clks 252 1>;
>> +        power-domains = <&k3_pds 252 TI_SCI_PD_EXCLUSIVE>;
>> +        assigned-clocks = <&k3_clks 252 1>;
>> +        assigned-clock-parents = <&k3_clks 252 5>;
>> +    };
>>
> 
> And where is the binding for the AM65x? I know that PG1 has nice
> erratum, but I would expect PG2 to be fine and register-wise compatible, no?

ti,am65-rti-wdt should be added as a new compatible to this binding once 
we have a board where we can actually support this. Right now TI AM65x 
boards depend on firmware for the ESM side support; there has been some 
internal discussion about how to get this done and I believe you are 
aware of that.

-Tero
--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
