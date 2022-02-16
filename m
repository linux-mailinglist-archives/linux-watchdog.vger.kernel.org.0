Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3CBE24B8F55
	for <lists+linux-watchdog@lfdr.de>; Wed, 16 Feb 2022 18:40:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234555AbiBPRkm (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 16 Feb 2022 12:40:42 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:34834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236547AbiBPRkl (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 16 Feb 2022 12:40:41 -0500
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 188B62B0B1F
        for <linux-watchdog@vger.kernel.org>; Wed, 16 Feb 2022 09:40:28 -0800 (PST)
Received: by mail-pg1-x534.google.com with SMTP id 139so2775379pge.1
        for <linux-watchdog@vger.kernel.org>; Wed, 16 Feb 2022 09:40:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=YmCC7nF0mE+4T4RrkLtybxlvgHhQZV1AzU8dDBkwRk8=;
        b=YZux4ZydX2FmDXDxeFD4c1uIw/E3iPaVkd5pC3KwAWh7KkT/bhAxkNR7/276xEVtXW
         /7tTbWiZcOmIotd+vQx2yFQ1YlZB97gHlq0xC5jyMPE1O0ONcGByaRVlnv/FOuBeZQi1
         NLsg27gNaYNAB1FUv1Q45uhb3/bkHy4EbcArDl8x+jSJaX/1QYSJRogTF6k336B3XI8b
         zG2bNYk4TJL0QI4IRObXHMqI5Ry5CZFrufQYX8RIrnA/D3mIGLZ1jCG5nEOGhL4L4QMX
         oqmu3aXBzaDu8S4O3H7aORF8Sx6p3l0hifstkPomxbHkZi7/v0OT8c+wdObaWxeHV+u3
         Wnmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=YmCC7nF0mE+4T4RrkLtybxlvgHhQZV1AzU8dDBkwRk8=;
        b=DaQxomqvacDebYWTE7VaRsLfJwuxmRAXjQkw88FZo3WdBlnSZ1bgOQreEI+SCC7ExX
         +qO0cjM//x5ErtqPvYgqcs4ewu/w3+Yluinye54U/6AnS85hWEoCuZlnoxA5xir95I4j
         BrS/7ssGH78wwBkqVS71xIEocKOWoAnf3mfYjXvhOaTaTMoqzcWKvgbb/nK1IdjvcP3e
         Y8N/86QstHiLvBU+TRSbH2IJjCgLlUuT1GEoyEDXn2vkj3z+x3uQ9JCtO9kzPZR/E2wh
         OFaZYkdwP3OzJ8Id78q4oQQy5tMwmzAhY+gZ/S/LHRcsXFdULck4AB6l99g2EKV+TFWA
         wbjQ==
X-Gm-Message-State: AOAM531SxKlso4mVRwtUrpwpUCcmwmSn9xCjC5mw0/+Vz4ox6RZv78LB
        9BXMJJmWnxdnUCp3xBmDTOk=
X-Google-Smtp-Source: ABdhPJxvZDjAtt79qQsnV6Pt6JgR+pxG/sgDAryElvT3H0qSwaaf+Ky7Mf2RCcoBvGRqlyd03MTU6g==
X-Received: by 2002:a05:6a00:c95:b0:4e1:3259:f7ad with SMTP id a21-20020a056a000c9500b004e13259f7admr4229697pfv.43.1645033228041;
        Wed, 16 Feb 2022 09:40:28 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id s29sm7636892pfg.146.2022.02.16.09.40.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Feb 2022 09:40:27 -0800 (PST)
Subject: Re: [PATCH] watchdog: bcm7038_wdt: Support BCM6345 compatible string
To:     =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        bcm-kernel-feedback-list@broadcom.com,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
References: <20220216063408.23168-1-zajec5@gmail.com>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <6a2901ed-17bb-1eb5-a24c-b229db309ad0@gmail.com>
Date:   Wed, 16 Feb 2022 09:40:22 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220216063408.23168-1-zajec5@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 2/15/22 10:34 PM, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> A new "compatible" value has been added in the commit 17fffe91ba36
> ("dt-bindings: watchdog: Add BCM6345 compatible to BCM7038 binding").
> It's meant to be used for BCM63xx SoCs family but hardware block can be
> programmed just like the 7038 one.
> 
> Cc: Florian Fainelli <f.fainelli@gmail.com>
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>

Acked-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
