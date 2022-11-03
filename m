Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6556661847E
	for <lists+linux-watchdog@lfdr.de>; Thu,  3 Nov 2022 17:31:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231940AbiKCQbx (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 3 Nov 2022 12:31:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232089AbiKCQb3 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 3 Nov 2022 12:31:29 -0400
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 953331D300;
        Thu,  3 Nov 2022 09:31:14 -0700 (PDT)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id EFF3284B26;
        Thu,  3 Nov 2022 17:31:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1667493073;
        bh=vNWJCYJcObPBb11Tmj7KXR9wbcEWaCMFJbG9Obc33kg=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=RjbrIbBgIdMdjJcWOFxQoxyK6frMjA9jSbR07mpY7QUZqCzmEMCjiwjBDDSgQMOOq
         hEpXFfJFYKDRKffeOFpxjliDXpjLn6o9s9gtdUovDEAPRY+B6wwLZzPCBDsjHcNjFs
         OR3aPQUxVVehOR+ddAdjYPb/y4UxIuKQpG+zZ7Y43AwfGQCD76+LkOfgylwl7Uc4+h
         X00UigcTJRaIgAwEMgKlMKZEYVaH/0CM0uOuF8064XSNkFGI8BLGxNLvx9CsrTyiQo
         4JboPbgJrzdbRssEKfcIltyBf/bsNzVIczNFbTFGJxkMfYb2QuSkh9LHWjLAuDhQ+X
         VVL0jvoysdRHw==
Message-ID: <a7db27cb-bb50-ed13-f2b7-54a8f66b1b97@denx.de>
Date:   Thu, 3 Nov 2022 17:31:12 +0100
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
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <20221103012205.GA2109899@roeck-us.net>
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

On 11/3/22 02:22, Guenter Roeck wrote:
> On Wed, Nov 02, 2022 at 11:05:30PM +0100, Marek Vasut wrote:
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
>> V2: - Add missing required: properties
>>      - Drop quotes around ref: referenced schema file name
>> ---
>> NOTE: The Maintainer entry should likely be changed, although it seems
>>        like this driver and its matching bindings are now unmaintained.
> 
> I still can not parse this note. The MAINTAINERS entry for watchdog devices
> includes
> 
> F:      Documentation/devicetree/bindings/watchdog/
> F:      drivers/watchdog/
> 
> which should cover both the old and the new bindings as well as the driver.
> 
> Please explain.

I don't mind placing you and Wim into the yaml DT maintainer section if 
that's OK with you ?
