Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB697429F42
	for <lists+linux-watchdog@lfdr.de>; Tue, 12 Oct 2021 10:04:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234870AbhJLIF6 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 12 Oct 2021 04:05:58 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:38262
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234826AbhJLIEC (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 12 Oct 2021 04:04:02 -0400
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com [209.85.167.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 676193FFFE
        for <linux-watchdog@vger.kernel.org>; Tue, 12 Oct 2021 08:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1634025685;
        bh=JHyKbjTift426wz+CkjwB4QsgP3nBOzBlm+zKKFBLrQ=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=nTdGrWM1g/ojwN4hcsHoB/xz8suphpUtgdoLWpb6ACX89k1iw/hNOZECaaVsscP6F
         4ihu31EiTHH3eHw46k5cg8KdjOUxDkCBTYeHfcnmPJnX7WRGxQlbBAMo6pyrTGvRi7
         C6nlNw8YRi2S54sCz7gzALyYxuxwKFb86si371qGUVcoLjYGrq+2mRRJvexAG0/Rdh
         6ixPx/Bk0CmLHyJGf7Fcxmm823kYFO0BH7xO9ftOXMLKl8jD8v4a0axo6S7pgf4i1F
         eG37edxwOtafFL+mc2N1TSCKBrczUfgk35Anbm/KpjNAjBXtMc3yNyjW1gkgjZOk6E
         zVyp/W4yzbH6Q==
Received: by mail-lf1-f69.google.com with SMTP id i40-20020a0565123e2800b003f53da59009so14559740lfv.16
        for <linux-watchdog@vger.kernel.org>; Tue, 12 Oct 2021 01:01:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=JHyKbjTift426wz+CkjwB4QsgP3nBOzBlm+zKKFBLrQ=;
        b=nPaLy/zoLRgzbknXsyFmdJHDH0lGwhf7YKesl5iWsMZPCEQW+zhuPqsg0fqPS00qzX
         SdcwVxNJfcbVdymyfMoxJeWW3ZN23OEAPybZQZLeMbMKRolj+0hX3164yQgssB+QQTJF
         YttnUViHP0oR+zegyibmFL5PhvzOM9zdKzoqwVGwu3Pzocur45+kBd5KndHiuY5BERXP
         LrjUYHtPbQJcWLn+FX0ChFDdl7P2PMz00wDqKol2MELndutFhxPz8H4Et8eFqll4JpBW
         E6U7OS70SBCiYBN+SZOfvz6VIGh0n/c3a4t+1VbFjXOSqNQd/yyiXE5l3nmyVOrqVmU4
         uFHA==
X-Gm-Message-State: AOAM530ojsLXvIKYxSiKHHIXDjyaL7xnxvyjJ88QJ6TgZ9/54MH7JRi5
        m8l3LM5ljsILaEitS0P0G5+zqBtHP0TihgId3/2QrbSV4HQvkF9Hw8/UDIiJ/7+uR2p4xn0KgMw
        UlL+kvusuiEwLtC95nxe1ZrluJh94347BSgQ50tpn/6bl
X-Received: by 2002:a05:6512:12d3:: with SMTP id p19mr33215022lfg.280.1634025684650;
        Tue, 12 Oct 2021 01:01:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzNBcrjWlAgA0DVgCpnAIyjVoJ0m61P7YwAe3a19d6w8XjZGCQJ4xECpD5up8MG19txYXE2gw==
X-Received: by 2002:a05:6512:12d3:: with SMTP id p19mr33214997lfg.280.1634025684383;
        Tue, 12 Oct 2021 01:01:24 -0700 (PDT)
Received: from [192.168.0.20] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id u27sm956373lfm.275.2021.10.12.01.01.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Oct 2021 01:01:23 -0700 (PDT)
Subject: Re: [PATCH 4/8] rtc: max77686: remove useless variable
To:     Luca Ceresoli <luca@lucaceresoli.net>, linux-kernel@vger.kernel.org
Cc:     Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
        linux-rtc@vger.kernel.org, linux-watchdog@vger.kernel.org,
        Chiwoong Byun <woong.byun@samsung.com>,
        Laxman Dewangan <ldewangan@nvidia.com>
References: <20211011155615.257529-1-luca@lucaceresoli.net>
 <20211011155615.257529-5-luca@lucaceresoli.net>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <43b0cc1e-8b65-0322-d8ee-a8e45f1aa8fe@canonical.com>
Date:   Tue, 12 Oct 2021 10:01:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211011155615.257529-5-luca@lucaceresoli.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 11/10/2021 17:56, Luca Ceresoli wrote:
> rtc_24hr_mode is set to 1 in max77686_rtc_probe()->max77686_rtc_init_reg()
> before being read and is never set back to 0 again. As such, it is de facto
> a constant.
> 
> Remove the variable and the unreachable code.
> 
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> ---
>  drivers/rtc/rtc-max77686.c | 11 +----------
>  1 file changed, 1 insertion(+), 10 deletions(-)
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
