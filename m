Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CF7CEE6031
	for <lists+linux-watchdog@lfdr.de>; Sun, 27 Oct 2019 03:04:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726548AbfJ0CEp (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 26 Oct 2019 22:04:45 -0400
Received: from mx2.suse.de ([195.135.220.15]:51512 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726525AbfJ0CEo (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 26 Oct 2019 22:04:44 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 969B5ABA0;
        Sun, 27 Oct 2019 02:04:42 +0000 (UTC)
Subject: Re: [PATCH v2 1/8] dt-bindings: watchdog: realtek: Convert RTD119x to
 schema
From:   =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>
To:     Rob Herring <robh@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
        linux-watchdog@vger.kernel.org,
        linux-realtek-soc@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20191020040817.16882-1-afaerber@suse.de>
 <20191020040817.16882-2-afaerber@suse.de> <20191025211638.GA28819@bogus>
 <aeb0d0ed-5649-9035-c753-39e8a1511c9d@suse.de>
Organization: SUSE Software Solutions Germany GmbH
Message-ID: <7fff9d25-e24a-c73e-b14f-12c66607fe3a@suse.de>
Date:   Sun, 27 Oct 2019 03:04:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <aeb0d0ed-5649-9035-c753-39e8a1511c9d@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Am 25.10.19 um 23:24 schrieb Andreas Färber:
> Am 25.10.19 um 23:16 schrieb Rob Herring:
>> On Sun, Oct 20, 2019 at 06:08:10AM +0200, Andreas Färber wrote:
>>> +properties:
>>> +  compatible:
>>> +    oneOf:
>>> +      - const: realtek,rtd1295-watchdog
>>
>> You can drop the 'oneOf' here unless you're planning to add another 
>> entry with 2 compatible strings.
> 
> It's a preparation for adding rtd1195-watchdog when needed, to make
> future diffs smaller. There's also RTD1395 and RTD1619 to be tested.
> 
>> With that,
>>
>> Reviewed-by: Rob Herring <robh@kernel.org>

Self-NAK.

The example doesn't pass dt_binding_check: It doesn't like the tabs
retained from the original binding. Replacing them with four spaces
makes it pass. Will post a v3.

As for the compatibles, currently in the rtd1195.dtsi patch I'm reusing
"realtek,rtd1295-watchdog", to avoid a dependency on the watchdog tree.

Long-term that's kind of ugly as it uses a later model number.
That leaves us with two alternatives:

a) "realtek,rtd1195-watchdog", "realtek,rtd1295-watchdog" - this
requires oneOf. Allows to distinguish between RTD1195 and RTD1295 while
remaining compatible with the current driver.

b) "realtek,rtd1195-watchdog" - requires the driver change now and
requires the binding to be merged before I can use it in the DT but
doesn't need oneOf here.

Guenter, any preference here?

Thanks,
Andreas

-- 
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 Nürnberg, Germany
GF: Felix Imendörffer
HRB 36809 (AG Nürnberg)
