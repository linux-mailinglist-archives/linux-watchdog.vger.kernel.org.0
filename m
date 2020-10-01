Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1692728012B
	for <lists+linux-watchdog@lfdr.de>; Thu,  1 Oct 2020 16:23:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732104AbgJAOXJ (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 1 Oct 2020 10:23:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732096AbgJAOXJ (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 1 Oct 2020 10:23:09 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B48BC0613D0;
        Thu,  1 Oct 2020 07:23:07 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id v12so3316649wmh.3;
        Thu, 01 Oct 2020 07:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Y+2B+pcV3Fu1pu4NHRwm3CYjaljlBcFBr4Ni3eTuikI=;
        b=nYMm1Op3IOaM0KSqxAndzKiQ2vv4rjVjHEh/864/SCK9F16+Pt8E5v/wGWZZr77J13
         ayJZlaADkprcKI0XJ3s3YX1s1/EZ3yRumDT4l4nRkBE6UED7kRIjhpBJFw9yMOp8xnWf
         gHSKSgorAlAW/+gP7ryrZ6ZfCDLWc4jNOJ34d7wBHxeJLIamBYyc18rVR4+GrbLxJype
         c4hqbHNw1Ys6OaS5/QE1V6JAB1nJtD8Glt3JmlNWJwFpMUNI8qVx8e6MqIECwhN/2m41
         +WON1Oq1B7DxmbK6Yb0QAVjf+b1eQVYIQutxJlg5ySL179W8LvzaYgdZ3GrBTZ5mXhgO
         N9Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Y+2B+pcV3Fu1pu4NHRwm3CYjaljlBcFBr4Ni3eTuikI=;
        b=ASiYSa9nJOUl4BsSWNAxujR0Kff8OIC5B/7FKFNfLSqxPY04SI4uQAfzpllJvd2t7J
         TZjFAOaXhUTZrQLGLKm1XqjksQ/uaXKXN0n1wBg+UV0Gf0cdKb4cAyx4CPXzHf3rWyAa
         XneSOEQmIHqQxa5ZurXx0YYVWZSiYzkLwA+FpCv6D+TbPiO/PGX2duo8F/8kEuqk+eoC
         rS2fCTtYYux4ijRPrtWe66K2Byugry45ETB8dmoNkmJiKy2K1FGAndRt9lttOtn2iPMj
         +UsoxKSYjAz87jjXrqCkZlJg7n0raaWHa94xUlyCyQW1uYwrnp/LHmoR+SLmCOCk2p7T
         xXzg==
X-Gm-Message-State: AOAM530FcV3boOipuPq9qql0bd/FPkEudNZIDufNCoX4qpvzJdbVRJTZ
        DtEDj5F9jB2pEqQ7AfoMLxhjmuzD5v5aPQ==
X-Google-Smtp-Source: ABdhPJxAPZCu4b1u8/joIZ2OxrpgS4eOuWo0l3x+CSD4FISYIxtkNNsR8R87Q8NjR9im+QOocPgHXg==
X-Received: by 2002:a1c:b7d7:: with SMTP id h206mr243842wmf.159.1601562185789;
        Thu, 01 Oct 2020 07:23:05 -0700 (PDT)
Received: from ziggy.stardust ([213.195.119.110])
        by smtp.gmail.com with ESMTPSA id h4sm10880906wrm.54.2020.10.01.07.23.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2020 07:23:03 -0700 (PDT)
Subject: Re: [v5,0/4] watchdog: mt8192: add wdt support
To:     Crystal Guo <crystal.guo@mediatek.com>, linux@roeck-us.net,
        robh+dt@kernel.org
Cc:     srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-watchdog@vger.kernel.org, seiya.wang@mediatek.com,
        Wim Van Sebroeck <wim@linux-watchdog.org>
References: <20200929032005.15169-1-crystal.guo@mediatek.com>
From:   Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <71e21cfd-fd44-2cf9-cf8a-f83dc1b0cc89@gmail.com>
Date:   Thu, 1 Oct 2020 16:23:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200929032005.15169-1-crystal.guo@mediatek.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi Crystal,

It seems you forgot to send the email to one of the maintainers, Wim.
Please make sure you add all the maintainers from get_maintainers.pl when you 
send a series.

Regards,
Matthias

On 29/09/2020 05:20, Crystal Guo wrote:
> v5 changes:
> fix typos on:
> https://patchwork.kernel.org/patch/11697493/
> 
> v4 changes:
> revise commit messages.
> 
> v3 changes:
> https://patchwork.kernel.org/patch/11692731/
> https://patchwork.kernel.org/patch/11692767/
> https://patchwork.kernel.org/patch/11692729/
> https://patchwork.kernel.org/patch/11692771/
> https://patchwork.kernel.org/patch/11692733/
> 
> Crystal Guo (4):
>    dt-binding: mediatek: watchdog: fix the description of compatible
>    dt-binding: mediatek: mt8192: update mtk-wdt document
>    dt-binding: mt8192: add toprgu reset-controller head file
>    watchdog: mt8192: add wdt support
> 
>   .../devicetree/bindings/watchdog/mtk-wdt.txt       |  5 ++--
>   drivers/watchdog/mtk_wdt.c                         |  6 +++++
>   .../dt-bindings/reset-controller/mt8192-resets.h   | 30 ++++++++++++++++++++++
>   3 files changed, 39 insertions(+), 2 deletions(-)
>   create mode 100644 include/dt-bindings/reset-controller/mt8192-resets.h
> 
