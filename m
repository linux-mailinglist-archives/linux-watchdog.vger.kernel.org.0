Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AC9AF61862C
	for <lists+linux-watchdog@lfdr.de>; Thu,  3 Nov 2022 18:29:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231401AbiKCR3J (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 3 Nov 2022 13:29:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231150AbiKCR3I (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 3 Nov 2022 13:29:08 -0400
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F56B2656;
        Thu,  3 Nov 2022 10:29:06 -0700 (PDT)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 31510851B1;
        Thu,  3 Nov 2022 18:29:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1667496544;
        bh=IHl019jdqKfFbYSgm9Uj6kDK3KytkmDfYv+y4AZRbY4=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=eKomvAs3wsOyZrSCiuznaNeYwUV2ThjC82nUG057c8UWsv8K4KaQw/n/xVIOnsDxU
         fJ+t+wF0sCFirWP13oghPg6djk/vT+wGuEQNRlYAweFTl++4mlGM/rCiqN60lv2/VC
         ej4pRQTXpS3c9jZWeodi0WHqf4a+4sYGP8Qsv86JG+4831L0geJvDPG8GgPczDxrAR
         8vMOIHdw+ZoOEiOA3S2QEqGFHqKImPrM19xymHcgtUicpjb/dviyKL/090irbmDsli
         Ks7euUq5n+0RqImi10UyB+pF3I+3dLB8Hi5h8bmI95kJR2IPRegLJ7dnANU0Bskdpx
         6P4JoLSLkta0A==
Message-ID: <fb37c08b-dfd8-2ff0-0e52-0c06fd7381ef@denx.de>
Date:   Thu, 3 Nov 2022 18:29:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v2] dt-bindings: watchdog: gpio: Convert bindings to YAML
Content-Language: en-US
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>
References: <20221103012205.GA2109899@roeck-us.net>
 <a7db27cb-bb50-ed13-f2b7-54a8f66b1b97@denx.de>
 <20221103172020.GA177861@roeck-us.net>
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <20221103172020.GA177861@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 11/3/22 18:20, Guenter Roeck wrote:
> On Thu, Nov 03, 2022 at 05:31:12PM +0100, Marek Vasut wrote:
>> On 11/3/22 02:22, Guenter Roeck wrote:
>>> On Wed, Nov 02, 2022 at 11:05:30PM +0100, Marek Vasut wrote:
>>>> Convert the gpio-wdt bindings from text to YAML ones, to permit DT validation.
>>>>
>>>> Signed-off-by: Marek Vasut <marex@denx.de>
>>>> ---
>>>> Cc: Guenter Roeck <linux@roeck-us.net>
>>>> Cc: Rob Herring <robh+dt@kernel.org>
>>>> Cc: Wim Van Sebroeck <wim@linux-watchdog.org>
>>>> Cc: linux-watchdog@vger.kernel.org
>>>> To: devicetree@vger.kernel.org
>>>> ---
>>>> V2: - Add missing required: properties
>>>>       - Drop quotes around ref: referenced schema file name
>>>> ---
>>>> NOTE: The Maintainer entry should likely be changed, although it seems
>>>>         like this driver and its matching bindings are now unmaintained.
>>>
>>> I still can not parse this note. The MAINTAINERS entry for watchdog devices
>>> includes
>>>
>>> F:      Documentation/devicetree/bindings/watchdog/
>>> F:      drivers/watchdog/
>>>
>>> which should cover both the old and the new bindings as well as the driver.
>>>
>>> Please explain.
>>
>> I don't mind placing you and Wim into the yaml DT maintainer section if
>> that's OK with you ?
> 
> Ah, you mean the _yaml_ Maintainer entry. Just add me; I can not make
> the call for Wim.

Yes, that entry. That's what I was wondering about.

I'll wait a bit before sending V3.
