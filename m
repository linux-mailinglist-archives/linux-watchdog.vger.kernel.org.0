Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D449A734299
	for <lists+linux-watchdog@lfdr.de>; Sat, 17 Jun 2023 19:24:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230213AbjFQRYc (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 17 Jun 2023 13:24:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230263AbjFQRYb (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 17 Jun 2023 13:24:31 -0400
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 655AE8F
        for <linux-watchdog@vger.kernel.org>; Sat, 17 Jun 2023 10:24:29 -0700 (PDT)
Received: by mail-ot1-x333.google.com with SMTP id 46e09a7af769-6b46831fd13so93351a34.3
        for <linux-watchdog@vger.kernel.org>; Sat, 17 Jun 2023 10:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687022668; x=1689614668;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=B9I7MWQpXPC3qB4ww5R9SeBpsQgF4SAgzLK5RrtU4Tk=;
        b=S2hw0Iyhz5x7760BSYOJogTbfpMH7dRCxIu1fCxRfEphm+87A4HnqZj9vimjc+4X+W
         Cb3QFDvCpDNr8Y3GM2Hv9mSxDJKKQ3wjyNI04MPRIcZgJSOqoJUcEl7fEqyFfSvX+9Dc
         Oyci5zEx5bz5d5+fWsoGU+N6Ap81EU0CWTzYfCF6YL/POTp0lodBEUTFfRBKgTUU/X4k
         3HvYtr97SVDyYFoDMcNfEdYckaVHOZZGrZzvqxkAeL796oFZlu2XkdHZKarVwMRf0jGD
         PkbW5KUcL3WVrGq/p6Y7JkVdU0TUD3CzwNUrLjd6TTS7Bp4V4YDXaxiAxLOIEoYPSk9C
         evtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687022668; x=1689614668;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B9I7MWQpXPC3qB4ww5R9SeBpsQgF4SAgzLK5RrtU4Tk=;
        b=CNUjF8+L4hnUJ2xA6lL1xm/ZUBGURflQmPcsNUKU7tkNVTNeuSMQpXd9+wP5RW+EA1
         gU7uWiNTUsfb7+FvK9AB3DrfLMdqq3aDo8UQHYpJIAeSEwZ/z903tGt/Mf4IVy6rU/Af
         qy2dHatZP4oBZ7HCFiz4LmVEfHYvMY9j5sxiWQdQDGw0KMhwueeNzQ5k+joBdv73v7Ew
         +vsQZe39sOdRDsN31l6QBiSEBUJadZcijaYIk/k3nt5G1pFmACMaeoTeyShKtfRyF7M0
         cy329MBBqgehOjV0W7CXQMwvXYlfne2DAWXb0U5kY16qTg+DiFXOvJeIMttnzPzqBYzs
         UmZw==
X-Gm-Message-State: AC+VfDw4pBrXLg28/BOcN0IUVsrgqho3Iv2tHLJEmFiQeScMmn5MaGgY
        ocVq7G6a0oyoSZJMC4XTzisv7MS1ybk=
X-Google-Smtp-Source: ACHHUZ6nitZJuIUToJJSP2H7jFDHZJR1cQuqAEL1u8cCfxF901zGUDcDlqbZ14sudNwm92xV2rmy+A==
X-Received: by 2002:a05:6830:3a99:b0:6b1:6f73:92eb with SMTP id dj25-20020a0568303a9900b006b16f7392ebmr2979014otb.37.1687022668663;
        Sat, 17 Jun 2023 10:24:28 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 25-20020aa79159000000b0062bc045bf4fsm15717789pfi.19.2023.06.17.10.24.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Jun 2023 10:24:27 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <2554f83c-2d7a-cdf0-0a84-4addc21073bd@roeck-us.net>
Date:   Sat, 17 Jun 2023 10:24:26 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] watchdog: ziirave_wdt: Switch i2c driver back to use
 .probe()
Content-Language: en-US
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     linux-watchdog@vger.kernel.org, kernel@pengutronix.de
References: <20230525210837.735447-1-u.kleine-koenig@pengutronix.de>
 <1a2f452a-14f4-4b29-b1c2-8e69d5d86814@roeck-us.net>
 <20230611111312.s4uauybzhqagjmoq@pengutronix.de>
From:   Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <20230611111312.s4uauybzhqagjmoq@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 6/11/23 04:13, Uwe Kleine-König wrote:
> Hello,
> 
> On Fri, May 26, 2023 at 09:55:20AM -0700, Guenter Roeck wrote:
>> On Thu, May 25, 2023 at 11:08:37PM +0200, Uwe Kleine-König wrote:
>>> After commit b8a1a4cd5a98 ("i2c: Provide a temporary .probe_new()
>>> call-back type"), all drivers being converted to .probe_new() and then
>>> 03c835f498b5 ("i2c: Switch .probe() to not take an id parameter")
>>> convert back to (the new) .probe() to be able to eventually drop
>>> .probe_new() from struct i2c_driver.
>>>
>>> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
>>
>> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> 
> I assume this is a nice start to get this applied for the next merge
> window. The patch didn't show up in next yet though. Is that because Wim
> didn't start applying patches yet, or is there a problem (like this
> patch being lost in Wim's mailbox)?
> 

lack of time on my side, and Wim typically picks up patches quite late into
his branch.

Guenter


