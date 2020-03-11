Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 02FF9181251
	for <lists+linux-watchdog@lfdr.de>; Wed, 11 Mar 2020 08:50:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728245AbgCKHtV (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 11 Mar 2020 03:49:21 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:53100 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728364AbgCKHtV (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 11 Mar 2020 03:49:21 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02B7mwkl001284;
        Wed, 11 Mar 2020 02:48:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1583912938;
        bh=Dt0IRyKZEWT9JVFxfFR5odUXV0yBX2GKXRx7gN7gnOE=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=GYNFIGyJW6mG2Fcwh3k1R+B6NNy2+4VdkMPbpJ+3xJe+1CFjQt4rWycyaUJPXOL3s
         VR28Mo7e1bzqG1to06qRMH4XRVc8yukHvA0G8UREFuAKBN94EHH+ZJ4gwMqUeImEgt
         VuLfSbr7PP1EoPEldH3aaegJRBtyL/hw0EKQFETM=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 02B7mwYJ061412
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 11 Mar 2020 02:48:58 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 11
 Mar 2020 02:48:58 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 11 Mar 2020 02:48:57 -0500
Received: from [127.0.0.1] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02B7mtZJ104143;
        Wed, 11 Mar 2020 02:48:56 -0500
Subject: Re: [PATCHv2 1/4] dt-bindings: watchdog: Add support for TI K3 RTI
 watchdog
To:     Rob Herring <robh@kernel.org>
CC:     <wim@linux-watchdog.org>, <linux@roeck-us.net>,
        <linux-watchdog@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>
References: <20200302200426.6492-1-t-kristo@ti.com>
 <20200302200426.6492-2-t-kristo@ti.com> <20200310193721.GA24150@bogus>
From:   Tero Kristo <t-kristo@ti.com>
Message-ID: <90e0e943-5b84-ba61-1b6f-fe9259415df7@ti.com>
Date:   Wed, 11 Mar 2020 09:48:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200310193721.GA24150@bogus>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 10/03/2020 21:37, Rob Herring wrote:
> On Mon, Mar 02, 2020 at 10:04:23PM +0200, Tero Kristo wrote:
>> TI K3 SoCs contain an RTI (Real Time Interrupt) module which can be
>> used to implement a windowed watchdog functionality. Windowed watchdog
>> will generate an error if it is petted outside the time window, either
>> too early or too late.
>>
>> Cc: Rob Herring <robh@kernel.org>
>> Cc: devicetree@vger.kernel.org
>> Signed-off-by: Tero Kristo <t-kristo@ti.com>
>> ---
>>   .../bindings/watchdog/ti,rti-wdt.yaml         | 52 +++++++++++++++++++
>>   1 file changed, 52 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/watchdog/ti,rti-wdt.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/watchdog/ti,rti-wdt.yaml b/Documentation/devicetree/bindings/watchdog/ti,rti-wdt.yaml
>> new file mode 100644
>> index 000000000000..3813f59fb6c3
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/watchdog/ti,rti-wdt.yaml
>> @@ -0,0 +1,52 @@
>> +# SPDX-License-Identifier: GPL-2.0
> 
> Dual license new bindings please:
> 
> (GPL-2.0-only OR BSD-2-Clause)

Ok, will fix this.

> 
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
>> +description: |+
> 
> You can drop '|+' as there's no formatting to preserve.

Ok.

> 
>> +  The TI K3 SoC watchdog timer is implemented via the RTI (Real Time
>> +  Interrupt) IP module. This timer adds a support for windowed watchdog
>> +  mode, which will signal an error if it is pinged outside the watchdog
>> +  time window, meaning either too early or too late. The error signal
>> +  generated can be routed to either interrupt a safety controller or
>> +  to directly reset the SoC.
>> +
> 
> Reference the common watchdog.yaml schema.

I believe you mean just adding:

allOf:
   - $ref: "watchdog.yaml#"


> 
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - ti,rti-wdt
> 
> Should be SoC specific possibly with a fallback.

Ok, will change this.

> 
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    maxItems: 1
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - clocks
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
>> +    main_rti0: rti@2200000 {
> 
> watchdog@...

Right.

> 
>> +        compatible = "ti,rti-wdt";
>> +        reg = <0x0 0x2200000 0x0 0x100>;
>> +        clocks = <&k3_clks 252 1>;
>> +        power-domains = <&k3_pds 252 TI_SCI_PD_EXCLUSIVE>;
> 
> Not documented.

For this and assigned-clocks below...

> 
>> +        assigned-clocks = <&k3_clks 252 1>;
>> +        assigned-clock-parents = <&k3_clks 252 5>;
> 
> Not documented.

Ok will fix these, I was grepping for examples under the yaml files and 
some seem to document these standard props, some not. But, I guess 
everything listed in the examples should be documented.

Sorry all this yaml stuff is still pretty new to me. >.<

-Tero

> 
>> +    };
>> -- 
>> 2.17.1
>>
>> --

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
