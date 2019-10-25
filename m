Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1D9F4E55CC
	for <lists+linux-watchdog@lfdr.de>; Fri, 25 Oct 2019 23:24:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725783AbfJYVYM (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 25 Oct 2019 17:24:12 -0400
Received: from mx2.suse.de ([195.135.220.15]:41466 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725283AbfJYVYM (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 25 Oct 2019 17:24:12 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 040CDB1C1;
        Fri, 25 Oct 2019 21:24:09 +0000 (UTC)
Subject: Re: [PATCH v2 1/8] dt-bindings: watchdog: realtek: Convert RTD119x to
 schema
To:     Rob Herring <robh@kernel.org>
Cc:     linux-realtek-soc@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20191020040817.16882-1-afaerber@suse.de>
 <20191020040817.16882-2-afaerber@suse.de> <20191025211638.GA28819@bogus>
From:   =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>
Organization: SUSE Software Solutions Germany GmbH
Message-ID: <aeb0d0ed-5649-9035-c753-39e8a1511c9d@suse.de>
Date:   Fri, 25 Oct 2019 23:24:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191025211638.GA28819@bogus>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Am 25.10.19 um 23:16 schrieb Rob Herring:
> On Sun, Oct 20, 2019 at 06:08:10AM +0200, Andreas Färber wrote:
>> Convert the Realtek watchdog binding to a YAML schema.
>>
>> Signed-off-by: Andreas Färber <afaerber@suse.de>
>> ---
>>  v2: New
>>  
>>  .../bindings/watchdog/realtek,rtd119x.txt          | 17 ----------
>>  .../bindings/watchdog/realtek,rtd119x.yaml         | 38 ++++++++++++++++++++++
>>  2 files changed, 38 insertions(+), 17 deletions(-)
>>  delete mode 100644 Documentation/devicetree/bindings/watchdog/realtek,rtd119x.txt
>>  create mode 100644 Documentation/devicetree/bindings/watchdog/realtek,rtd119x.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/watchdog/realtek,rtd119x.txt b/Documentation/devicetree/bindings/watchdog/realtek,rtd119x.txt
>> deleted file mode 100644
>> index 05653054bd5b..000000000000
>> --- a/Documentation/devicetree/bindings/watchdog/realtek,rtd119x.txt
>> +++ /dev/null
>> @@ -1,17 +0,0 @@
>> -Realtek RTD1295 Watchdog
>> -========================
>> -
>> -Required properties:
>> -
>> -- compatible :  Should be "realtek,rtd1295-watchdog"
>> -- reg        :  Specifies the physical base address and size of registers
>> -- clocks     :  Specifies one clock input
>> -
>> -
>> -Example:
>> -
>> -	watchdog@98007680 {
>> -		compatible = "realtek,rtd1295-watchdog";
>> -		reg = <0x98007680 0x100>;
>> -		clocks = <&osc27M>;
>> -	};
>> diff --git a/Documentation/devicetree/bindings/watchdog/realtek,rtd119x.yaml b/Documentation/devicetree/bindings/watchdog/realtek,rtd119x.yaml
>> new file mode 100644
>> index 000000000000..5d92cfdfd046
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/watchdog/realtek,rtd119x.yaml
>> @@ -0,0 +1,38 @@
>> +# SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: "http://devicetree.org/schemas/watchdog/realtek,rtd119x.yaml#"
>> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
>> +
>> +title: Realtek RTD1295 Watchdog
>> +
>> +maintainers:
>> +  - Andreas Färber <afaerber@suse.de>
>> +
>> +allOf:
>> +  - $ref: watchdog.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    oneOf:
>> +      - const: realtek,rtd1295-watchdog
> 
> You can drop the 'oneOf' here unless you're planning to add another 
> entry with 2 compatible strings.

It's a preparation for adding rtd1195-watchdog when needed, to make
future diffs smaller. There's also RTD1395 and RTD1619 to be tested.

> 
> With that,
> 
> Reviewed-by: Rob Herring <robh@kernel.org>

Thanks,
Andreas

-- 
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 Nürnberg, Germany
GF: Felix Imendörffer
HRB 36809 (AG Nürnberg)
