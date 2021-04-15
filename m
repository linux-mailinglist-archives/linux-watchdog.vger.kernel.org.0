Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03758360A7F
	for <lists+linux-watchdog@lfdr.de>; Thu, 15 Apr 2021 15:29:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232759AbhDON3h (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 15 Apr 2021 09:29:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230202AbhDON3h (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 15 Apr 2021 09:29:37 -0400
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com [IPv6:2607:f8b0:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F071C061574;
        Thu, 15 Apr 2021 06:29:13 -0700 (PDT)
Received: by mail-ot1-x32b.google.com with SMTP id v19-20020a0568300913b029028423b78c2dso13926556ott.8;
        Thu, 15 Apr 2021 06:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=iRMfRLnB5bROoHYofqRSJiqLYS8/RC6ZA4ZH0uSYqlQ=;
        b=fvW4NurmWafjYa2IemJVvF5rfOs0y4DCrNTHRDYRTITJIFgkXdjlc8/zbWm1iYDr6S
         jsIGVCQAW5KW8ZHCSf5uo7QCTafYDVT8VrrhSG9wbvlcZYlCDE3reGDc35zzW57eHJhO
         8OSh4WeaeeHV7IkUKaypDrhgmHS06K1qZuQqWG9m3NFz2MV3w8A32QIIWazHSCmi9Ch/
         JMGao/4/voPxLl7VaAfD9B4Opcqb/ruVE2acD89yTnDzOrv7xo3bDrZMQATIVpOafZta
         SWvh1MtESwF//BaAcX6B4fVfEyZooVQ5zIQMv0GhFt5vMoNNyBX0VgNAG2d6JDFqxXl2
         yJpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=iRMfRLnB5bROoHYofqRSJiqLYS8/RC6ZA4ZH0uSYqlQ=;
        b=HB5izqLrE5ZmbmwRsiGPXjskkXwioUyodzXF1SPLYPbev6ith+T9aASub6w+i/rHyi
         +el2u4E7TkgkEI5bCo4kl/nKIFNmgDmMqwmSNuHH72y1a8JhOXB9h9e8ntfAF8GBlw7c
         uvvCbBdVGtYbZRZpsK/D7ulaNSTygzLgncWRNwMb1ZCfFaw99aZ3TvL8l7Xg3Vy9cWhD
         9iOmQCywy2KMBRC5J7MM87ATjIxCaHKpmnE/oayAEIeG99tNEuXLezN7niTqMmAwJ+BI
         96H5JDGC99QJeP8mXvI3xvvufULdfPALLJ0hGTGm6rnwB/YiM8oMdPJGhWoubage+WpE
         aBpg==
X-Gm-Message-State: AOAM530xRg/ZRpm4W5c6zLMiSJ396WBUlTl1oVs8vargKqWWXwRct0ER
        hNl4PP7tdX+h4lu2AOhO1mDAZbxqLcc=
X-Google-Smtp-Source: ABdhPJwHKws/1quGGeAvrACadQrqk4XwlOhufWeSn6/M3hVqwyMiig6CZiCVU16+z9ud6f8Iv73TQQ==
X-Received: by 2002:a9d:761a:: with SMTP id k26mr2651635otl.193.1618493352731;
        Thu, 15 Apr 2021 06:29:12 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 64sm543571oob.12.2021.04.15.06.29.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Apr 2021 06:29:11 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH V3] watchdog: mtk: support pre-timeout when the bark irq
 is available
To:     =?UTF-8?B?546L5pOO?= <wangqing@vivo.com>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <AAgApgCdDjCicbWFGpPmeaor.3.1618479605424.Hmail.wangqing@vivo.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <7555c705-a12d-5d51-3881-68feb5d078c1@roeck-us.net>
Date:   Thu, 15 Apr 2021 06:29:09 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <AAgApgCdDjCicbWFGpPmeaor.3.1618479605424.Hmail.wangqing@vivo.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 4/15/21 2:40 AM, 王擎 wrote:

> 
> Yes, as mentioned before, the behavior of WDT_MODE_IRQ_EN is use irq instead of
> reset, so we must use WDT_MODE_IRQ_EN | WDT_MODE_DUAL_EN if like you said
> "the first time generating an interrupt and the second time resetting the system" . 
> 
> The Dual mode is mentioned in the MTK datasheet:
> In this mode, the watchdog will be AUTO-RESTART after interrupt is triggered. 
> AP need to clear WDT_STA after receiving interrupt from TOPRGU, or system reset
> will be triggered after watchdog timer expires.
> Instructions for use：
> Set wdt_en = 1'b1.
> Set dual_mode = 1'b1.
> Set wdt_irq = 1'b1.
> 
> We can use Dual mode to achieve pretimeout behavior, only in this way can we
> get more information during pretimeout processing, instead of directly resetting.
> 

If so, the pretimeout would always be half of the full timeout, and the timeout
to configure would be timeout / 2. The code would have to adjust the pretimeout
time accordingly. Also, to avoid unexpected and changed behavior, the prefimeout
should by default be disabled.

Guenter


