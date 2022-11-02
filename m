Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 14FBB617031
	for <lists+linux-watchdog@lfdr.de>; Wed,  2 Nov 2022 23:05:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229826AbiKBWFF (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 2 Nov 2022 18:05:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229681AbiKBWFD (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 2 Nov 2022 18:05:03 -0400
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D47ECFD3B;
        Wed,  2 Nov 2022 15:05:02 -0700 (PDT)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 73D66850BD;
        Wed,  2 Nov 2022 23:05:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1667426701;
        bh=V7NPQFH72lMFxym/zodtxWXzayiB9xL3wEl+LDoFHNQ=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=hutg4oloLLuJ7QFhTbbkswHrggiDIA/43VA8AbKyLPUe1Z8AcTSUETV7xDDEi+jC5
         fwUmn989e8KR6ndgrl5ZQYGm5r1LDK3dxhPn3WCpdPYYputla68r4J8bue2xyHXoSp
         fIMLxJR1G8GhfQgyaFcUvXMF2vkeImRLhFYac+KZ4id56BfGhnu3LrVJuCM6Ca2ge3
         9QfAcQuMH0gR7E2GF/cyOiQ8kZQP0S636YYAwCbTjxhWxaiRLrtt8wXqpMOYdLso7T
         bSErf/a4hnw1vrZjHikO7mWK3ySAKusKiTY+F4/9QKncLGN6e0IVubDS8Z6YIWLwqb
         JzpD/uYqpWs8A==
Message-ID: <7f8a461d-99eb-faa2-2277-dde60594cdd9@denx.de>
Date:   Wed, 2 Nov 2022 23:04:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH RESEND] dt-bindings: watchdog: gpio: Convert bindings to
 YAML
Content-Language: en-US
To:     Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org
Cc:     linux-watchdog@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>
References: <20221102194436.123316-1-marex@denx.de>
 <5cb7cad9-bd58-ad5b-0a0c-eb2f879663c4@kernel.org>
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <5cb7cad9-bd58-ad5b-0a0c-eb2f879663c4@kernel.org>
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

On 11/2/22 22:30, Krzysztof Kozlowski wrote:
> On 02/11/2022 15:44, Marek Vasut wrote:
>> Convert the gpio-wdt bindings from text to YAML ones, to permit DT validation.
>>
>> Signed-off-by: Marek Vasut <marex@denx.de>
>> ---
>> Cc: Guenter Roeck <linux@roeck-us.net>
>> Cc: Rob Herring <robh+dt@kernel.org>
>> Cc: Wim Van Sebroeck <wim@linux-watchdog.org>
>> Cc: linux-watchdog@vger.kernel.org
>> To: devicetree@vger.kernel.org
>> ---
>> NOTE: The Maintainer entry should likely be changed, although it seems
>>        like this driver and its matching bindings are now unmaintained.
> 
> Please use scripts/get_maintainers.pl to get a list of necessary people
> and lists to CC.  It might happen, that command when run on an older
> kernel, gives you outdated entries.  Therefore please be sure you base
> your patches on recent Linux kernel.
> 
> Even if driver does not have updated maintainers entry, generic rules apply.

I'm based on next-20221102, i.e. todays' next, should be recent enough.

$ ./scripts/get_maintainer.pl -f drivers/watchdog/gpio_wdt.c
Wim Van Sebroeck <wim@linux-watchdog.org> (maintainer:WATCHDOG DEVICE 
DRIVERS)
Guenter Roeck <linux@roeck-us.net> (maintainer:WATCHDOG DEVICE DRIVERS)
linux-watchdog@vger.kernel.org (open list:WATCHDOG DEVICE DRIVERS)
linux-kernel@vger.kernel.org (open list)

Running it against the bindings file, old or new, just adds the DT 
maintainers into the list, so not much help either. Hence the NOTE.

[...]

The rest is fixed in v2, thanks.
