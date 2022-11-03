Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A35656182DA
	for <lists+linux-watchdog@lfdr.de>; Thu,  3 Nov 2022 16:30:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230381AbiKCPaM (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 3 Nov 2022 11:30:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231523AbiKCP3v (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 3 Nov 2022 11:29:51 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50D221AF21;
        Thu,  3 Nov 2022 08:29:17 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id CA3A961F09;
        Thu,  3 Nov 2022 15:29:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93A19C433C1;
        Thu,  3 Nov 2022 15:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1667489356;
        bh=f//qjav0Y3qiR1pi56bZUd2lTeTDrl3MdsRvnrv1nWU=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=IbX/DsjikMUHD+9fwDZEwI3Yq/ZuTcZHQWoanvdv5RZVqu3nESLhPjct0Ho1MM1hl
         ZgIx6TMlcpYWlJIkqF3SpWLBk46c3AAN5KZIJZvogWgCc+t312x+wkrD9z2UsWjrts
         Ed4aaIum9myZGkUwOqo+8ui6y+xspMAb187uV/Lj4VLRlP8fTm/nklGu+j4Uj3V9fe
         WR0C7hmSInEMcb+bC+JuXLsPdpkcZ3s7k1tYffCucfSVRKKU7cRqcieKwtWqq0R0gX
         qCjzOW2PECfJvx+QhrKEPq2nxYdPznnTQTu53LUMbiFr//vnirE1AFBr4KTTZuOJre
         BCY1vTtbNVvyw==
Message-ID: <b9fb1440-4c0c-4742-150d-3f3a83a1a952@kernel.org>
Date:   Thu, 3 Nov 2022 11:29:14 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH RESEND] dt-bindings: watchdog: gpio: Convert bindings to
 YAML
Content-Language: en-US
To:     Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org
Cc:     linux-watchdog@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>
References: <20221102194436.123316-1-marex@denx.de>
 <5cb7cad9-bd58-ad5b-0a0c-eb2f879663c4@kernel.org>
 <7f8a461d-99eb-faa2-2277-dde60594cdd9@denx.de>
From:   Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <7f8a461d-99eb-faa2-2277-dde60594cdd9@denx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-8.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 02/11/2022 18:04, Marek Vasut wrote:
> On 11/2/22 22:30, Krzysztof Kozlowski wrote:
>> On 02/11/2022 15:44, Marek Vasut wrote:
>>> Convert the gpio-wdt bindings from text to YAML ones, to permit DT validation.
>>>
>>> Signed-off-by: Marek Vasut <marex@denx.de>
>>> ---
>>> Cc: Guenter Roeck <linux@roeck-us.net>
>>> Cc: Rob Herring <robh+dt@kernel.org>
>>> Cc: Wim Van Sebroeck <wim@linux-watchdog.org>
>>> Cc: linux-watchdog@vger.kernel.org
>>> To: devicetree@vger.kernel.org
>>> ---
>>> NOTE: The Maintainer entry should likely be changed, although it seems
>>>        like this driver and its matching bindings are now unmaintained.
>>
>> Please use scripts/get_maintainers.pl to get a list of necessary people
>> and lists to CC.  It might happen, that command when run on an older
>> kernel, gives you outdated entries.  Therefore please be sure you base
>> your patches on recent Linux kernel.
>>
>> Even if driver does not have updated maintainers entry, generic rules apply.
> 
> I'm based on next-20221102, i.e. todays' next, should be recent enough.
> 
> $ ./scripts/get_maintainer.pl -f drivers/watchdog/gpio_wdt.c
> Wim Van Sebroeck <wim@linux-watchdog.org> (maintainer:WATCHDOG DEVICE 
> DRIVERS)
> Guenter Roeck <linux@roeck-us.net> (maintainer:WATCHDOG DEVICE DRIVERS)
> linux-watchdog@vger.kernel.org (open list:WATCHDOG DEVICE DRIVERS)
> linux-kernel@vger.kernel.org (open list)
> 
> Running it against the bindings file, old or new, just adds the DT 
> maintainers into the list, so not much help either. Hence the NOTE.

Yet you did not CC all DT binding maintainers, hence my reply.

Best regards,
Krzysztof

