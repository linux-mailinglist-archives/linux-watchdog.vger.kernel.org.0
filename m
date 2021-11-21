Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1CBD64584C1
	for <lists+linux-watchdog@lfdr.de>; Sun, 21 Nov 2021 17:48:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237989AbhKUQvd (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 21 Nov 2021 11:51:33 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:49346
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229641AbhKUQvd (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 21 Nov 2021 11:51:33 -0500
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com [209.85.167.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 58FA63F177
        for <linux-watchdog@vger.kernel.org>; Sun, 21 Nov 2021 16:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1637513307;
        bh=K8WNLh2BhNltzeUMzWCHhBj0rP6siNBgFRXvuYUpglA=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=XS0scDyAfhoejAEElxhW8ih9X6w/Li/cXcwoVbVgEbJr6Rv8ebxnu7X+mJBvFpRQq
         H7u/1N4HxJvU77HdnhRwijtd9vRpnHWhCnFUZoiGCP/zt+FBiecqcTeObbKeEYpK1t
         WnxT+W4M8fHCXZoAYOp0vldU32/gtS5LHVmDt13NApO1TFvvFMV7WfkDOd7jXYrBhR
         tZDeB3ScYK7oulc8dpw+Qh5PyGIQa2mNpWz9qFrR8+hgxmi+2l/ZPFQVuJWCfQ/8jg
         vmI28leUo3Ftzvlh+5R4jaZSoySykHyswxa14xG77baqVQyImTSayayAmrhyEEFoy6
         urb3VZTxIp3Rw==
Received: by mail-lf1-f72.google.com with SMTP id f15-20020a056512228f00b004037c0ab223so10341657lfu.16
        for <linux-watchdog@vger.kernel.org>; Sun, 21 Nov 2021 08:48:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=K8WNLh2BhNltzeUMzWCHhBj0rP6siNBgFRXvuYUpglA=;
        b=H1gtqybrvGYV1V0trc5iMgwySQeFQ8A/pt5fbA+LhYoJtB53pWNCJrHQnjtG4XXrRl
         OMldCZV6fbFAgwASIw04OT7ImeO32ZcF2FY0ZFtIURtOEfDyIfrk8YGzxagdNF1glDdQ
         zWYhgqiytFNRfp3MCgFr/D1eTfnpx7D1T9iInvL41w3iPk28ZzxqX147uRRnaHzaQVwB
         MggnpM6NTuMDmF0HcpzspemGUM7h/++syVIbMoM53Kbu1NYGBfMvd2iN0V8g3tAs7JXw
         gfFC35z+3UHku0tTjpEkM9pn48+Bo2+QQc3tkwini5YduBWtpBthXBQ1xzHFHwpAlVdm
         h1nw==
X-Gm-Message-State: AOAM530Uhi160dasc/gwqrMWCkA9D820Y//Bsh1CPrybIjpyHRhnYyPR
        Va/G1kmBHoh3Rnx0H26zjx3dZiDTxcSiQTOt+EzsW5k4c9QAfQFxy2QGafo2v6HqoBaEO19oJ+Y
        qcj85l+wr7rDlZS53u3JODMJ2aShsIEXvbVg/JrUi2VpU
X-Received: by 2002:a2e:141e:: with SMTP id u30mr44782266ljd.434.1637513306837;
        Sun, 21 Nov 2021 08:48:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzivQ+d3pUhfOFGcDUzWT7iqm/ykn54rpcjdMc9CACB6IBgMojuJVrO+qMAr6C3C6u/fB2log==
X-Received: by 2002:a2e:141e:: with SMTP id u30mr44782237ljd.434.1637513306650;
        Sun, 21 Nov 2021 08:48:26 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id bp41sm692511lfb.129.2021.11.21.08.48.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Nov 2021 08:48:26 -0800 (PST)
Message-ID: <5e5bc9ca-b648-e465-1638-adb0a26500de@canonical.com>
Date:   Sun, 21 Nov 2021 17:48:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH v4 4/9] dt-bindings: mfd: add Maxim MAX77714 PMIC
Content-Language: en-US
To:     Luca Ceresoli <luca@lucaceresoli.net>, linux-kernel@vger.kernel.org
Cc:     Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
        linux-rtc@vger.kernel.org, linux-watchdog@vger.kernel.org,
        Chiwoong Byun <woong.byun@samsung.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Rob Herring <robh@kernel.org>
References: <20211120155707.4019487-1-luca@lucaceresoli.net>
 <20211120155707.4019487-5-luca@lucaceresoli.net>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211120155707.4019487-5-luca@lucaceresoli.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 20/11/2021 16:57, Luca Ceresoli wrote:
> Add bindings for the MAX77714 PMIC with GPIO, RTC and watchdog.
> 
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> Reviewed-by: Rob Herring <robh@kernel.org>
> 
> ---
> 
> Changes in v4: none
> 
> Changes in v3:
>  - add 'regulators' node (Krzysztof Kozlowski, Rob Herring)
> 
> Changes in v2: none
> ---
>  .../bindings/mfd/maxim,max77714.yaml          | 68 +++++++++++++++++++
>  MAINTAINERS                                   |  5 ++
>  2 files changed, 73 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/maxim,max77714.yaml
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
