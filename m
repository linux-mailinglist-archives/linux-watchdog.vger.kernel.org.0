Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD9163FEED4
	for <lists+linux-watchdog@lfdr.de>; Thu,  2 Sep 2021 15:39:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345280AbhIBNkP (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 2 Sep 2021 09:40:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345197AbhIBNkO (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 2 Sep 2021 09:40:14 -0400
Received: from mail-oo1-xc2e.google.com (mail-oo1-xc2e.google.com [IPv6:2607:f8b0:4864:20::c2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF747C061575;
        Thu,  2 Sep 2021 06:39:15 -0700 (PDT)
Received: by mail-oo1-xc2e.google.com with SMTP id v20-20020a4a2554000000b0028f8cc17378so548645ooe.0;
        Thu, 02 Sep 2021 06:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=3i9b/QDZb0cse/arJkVkj0b5E9JeYEobASX++MvsNrs=;
        b=NfYAO8z9mtmm847ShzIy99zyzotuORd5O5hOaViSCS4pfEiM87XvbYr67wtREsZZQ/
         OkJ/irNVWESUmnQXvAxZV9FR9ZSTpECRewMRz2LhQioy5Dxa9C3dDVspRT8aN595yDYc
         ZVxGv0uq8/qD9BIdg7KQN2FzModAbyf0clX1uUwPmQ94Yf5BuZVMe5o3hXk+peBhtPO1
         XxWiSd66X17EYcD2qctpzkmnSWMiFe7zlytAPbB+Bz65nRk3DWE5NrDsHPTgV9bcWJrH
         7BddXBHw7dHINar0EU6Kqbw5rRjgybCOXtuX7ivD6d0jGTVSmKN+mtiKekgO2eoL3zlG
         YDYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=3i9b/QDZb0cse/arJkVkj0b5E9JeYEobASX++MvsNrs=;
        b=savkCH86C+bO1HefQ4J/gitJOsqgX9J2KdtZEu2IpW10+QHwA7nIdmrgh3evbpNr/F
         1LNUruv8uNvn7mGjGSZwiyu97iwELLlkQoII366zDqCVtqkDCol5S3LUCAYVnUYwgNJk
         K1Cy1/usaBYWS2Q21aiWkF/S9aO7l8htQHkqr+ZIx+h0pwVF3P3ojkctX7ZMX4LAnOMn
         bg662e1DjJ2Jjx3RdW0NarlQdHiDsbAWYvqZTZveEknFNdL16aArZObmloN2v/fGbErN
         AkE2FrXUS2mngC85wpp8ON6r70kZbAPBR9a/QZ0aYtZ2v72ys57ZaOyPqdpXxCZtUCqG
         9kRA==
X-Gm-Message-State: AOAM5323LRlj1Pt1AB3DG9w5iTVA2p5G9y2obkSoq9feaIWCjjPvIP44
        SDMrW6E/uWCxcSJWHjzIYq4=
X-Google-Smtp-Source: ABdhPJw6UxVSqB/f6mIJ0rQpsJAWLniTlOizp9qJQDJ94lgl/iCffTkeQbomVaSHwrz0N7O+ZtgJRw==
X-Received: by 2002:a05:6820:613:: with SMTP id e19mr2630962oow.67.1630589953913;
        Thu, 02 Sep 2021 06:39:13 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id n13sm339294otr.11.2021.09.02.06.39.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Sep 2021 06:39:13 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH] watchdog: mtk: add disable_wdt_extrst support
To:     Fengquan Chen <Fengquan.Chen@mediatek.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     tinghan.shen@mediatek.com, randy.wu@mediatek.com,
        rex-bc.chen@mediatek.com, christine.zhu@mediatek.com,
        joe.yang@mediatek.com, zhishuang.zhang@mediatek.com
References: <1630569881-6032-1-git-send-email-Fengquan.Chen@mediatek.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <4a7c1fa7-cd56-54c0-7b3c-ed48ec0e886d@roeck-us.net>
Date:   Thu, 2 Sep 2021 06:39:11 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1630569881-6032-1-git-send-email-Fengquan.Chen@mediatek.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 9/2/21 1:04 AM, Fengquan Chen wrote:
> From: "fengquan.chen" <fengquan.chen@mediatek.com>
> 
> In some cases, we may need watchdog just to trigger an
> internal soc reset without sending any output signal.
> 
> Provide a disable_wdt_extrst parameter for configuration.
> We can disable or enable it just by configuring dts.
> 
> fengquan.chen (1):
>    watchdog: mtk: add disable_wdt_extrst support
> 
>   drivers/watchdog/mtk_wdt.c | 7 +++++++
>   1 file changed, 7 insertions(+)
> 

A single patch does not require an introductory e-mail.
Also, if provided, it needed to be numbered (PATCH 0/1)
to distinguish it from the actual patch.

Guenter
