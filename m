Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E6F4F5638B4
	for <lists+linux-watchdog@lfdr.de>; Fri,  1 Jul 2022 19:49:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230406AbiGARsw (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 1 Jul 2022 13:48:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229968AbiGARsv (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 1 Jul 2022 13:48:51 -0400
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1388538BDA;
        Fri,  1 Jul 2022 10:48:51 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id jb13so2998035plb.9;
        Fri, 01 Jul 2022 10:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:content-language:to
         :cc:references:from:subject:in-reply-to:content-transfer-encoding;
        bh=w8ctqatJb7u4wWUQyGLLZgkC1Wle0LtPgmcAJi4CUns=;
        b=A5Wvvtym4/wLlTBOj30oJN9D7GLZIYLlK8s5IFwowxkRKWAxC1zm/aEYNQg5xOcf3J
         PrJOSYJdpNvEay2v8U+GvkqgjrvaQtZu/RKsead4yU+wLwdIJIbyXjsu0f4m4Xcugf/a
         2uZL34ba0aTPHzOZ4VntmCAOUbsj8ACY9dTCkjEmzPD6b0oso8xOD9lEuWKUvoELQfh8
         ZzzO+6wo6inzFVaWhHrsIFMmL9pAwi9nTTQ2N2DBejuOgEUH4RDjPkzV5AgBsEYyaJ3T
         6GiT/nwYmz4WPE7kT0wTyx6P8taDiavSq58lO4YzgAIlj/Op6ObtzpUvpmwLA4OTxEme
         P1OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :content-language:to:cc:references:from:subject:in-reply-to
         :content-transfer-encoding;
        bh=w8ctqatJb7u4wWUQyGLLZgkC1Wle0LtPgmcAJi4CUns=;
        b=PrBUSCZsA9Aaj7n92jnX/41tMoShQf7qsGUWe8+BY/82GQ+YhnBO3YkZgiQgw0XWK4
         zuw42n1CkvhjuNytc5mpw82lUEq34ux49b//m0ppDw8OZ5HsTjISoSaoZ+GMsk1MJDRz
         0fMWogPbiluochxaYVyro7rhOCoUIKiP8Fpg1Qdu2waVzhoDu/QC0mFrR/xjrUL9Hnlh
         fFx2NcgsOhLm3lIcpVnWSKAMZRbtY/9vMXV92UIK/Ov182+imvyp/sFDNzDeWKKGGKYm
         ui1mfWqzY2gDSgLCMA2SU7VqVkJg4mvd0mJps2MIJhcrqnVDbOOkepAVHKlrmFcx0o3+
         MaJg==
X-Gm-Message-State: AJIora9Ixz6maF7G0OpsxadYZDAsHIB2OAlfCfbkqQrpFH9bQBZllwT7
        Jupwi9PwDXCTfQeG3oA+8EaO49ZRFuA=
X-Google-Smtp-Source: AGRyM1s0b4US9fvkID/aTJUDfgkNZbYGo6AEeGc9vKfLGCGEQjcbNFTPqhIqXILiZggwaSRK4ixsjA==
X-Received: by 2002:a17:902:edd1:b0:158:8318:b51e with SMTP id q17-20020a170902edd100b001588318b51emr21900633plk.89.1656697730516;
        Fri, 01 Jul 2022 10:48:50 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d76-20020a621d4f000000b005255151e248sm16539633pfd.174.2022.07.01.10.48.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Jul 2022 10:48:49 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <0d045bb8-a519-39d4-17fa-123f90969bd9@roeck-us.net>
Date:   Fri, 1 Jul 2022 10:48:47 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>,
        Isaac True <isaac.true@canonical.com>
Cc:     linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        wim@linux-watchdog.org
References: <20220629110626.2158127-1-isaac.true@canonical.com>
 <20220629110626.2158127-2-isaac.true@canonical.com>
 <20220701171829.GA1149706-robh@kernel.org>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH 2/2] watchdog: gpio: add configurable minimum interval
In-Reply-To: <20220701171829.GA1149706-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 7/1/22 10:18, Rob Herring wrote:
> On Wed, Jun 29, 2022 at 01:06:26PM +0200, Isaac True wrote:
>> Add the "min_hw_margin_ms" parameter to gpio_wdt devices, allowing a
>> minimum interval to be specified, stopping watchdog devices from being
>> fed too quickly if they require a certain interval between feeds.
> 
> I assume there is some real platform with a real problem you are trying
> to solve? Details please.
> 

Agreed, this should be explained in more detail.

> Can you just hardcode some min? Maybe 10% of the max or something. Is
> there a downside to a larger than necessary min?
> 

That would result in extra overhead in the watchdog core which would not
be required for all other hardware using this driver. I'd rather avoid that.

> Wouldn't be better to fix this without requiring a DT change and that
> could work on stable kernels if needed.
> 

Presumably that is some new hardware. Most of the watchdog drivers
needing this value can derive it from the compatible property. The
gpio watchdog driver is a bit different since it is supposed to work
on a variety of hardware using gpio pins for watchdog control.

Guenter
