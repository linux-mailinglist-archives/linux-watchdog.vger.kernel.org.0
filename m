Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D57B402EF0
	for <lists+linux-watchdog@lfdr.de>; Tue,  7 Sep 2021 21:28:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234528AbhIGT3Z (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 7 Sep 2021 15:29:25 -0400
Received: from mail-oo1-f46.google.com ([209.85.161.46]:35539 "EHLO
        mail-oo1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229574AbhIGT3Y (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 7 Sep 2021 15:29:24 -0400
Received: by mail-oo1-f46.google.com with SMTP id y3-20020a4ab403000000b00290e2a52c71so124325oon.2;
        Tue, 07 Sep 2021 12:28:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=TFNxI/th+I6c8v2S1JhOFknsclAVoGZJrQS33g8IB4s=;
        b=eVIS3EcZbE2zeKIIhu8+LxuBw4cJ8CfHRMnNHR52UDNWfo2GlfolKlntX8agJ6+QcY
         ujnweaz3RM9n2jF3AHEHRGitEhR4wNrdpF6g5ytqR2aoMeQ2XhP0hO2O900ku66EPcgV
         84454TIGv+lAJ8MDMUc3NDGLK1dtNaY6O+G6AdzagOfd6lii5MP8kbs1Tn9gNQ/tKs6i
         fKDJHtZhVFZtq4yR1nfRc+WuCom0yJzMeErVemrkcrTE42VD9nUJLLkFql+Qpfq8JlNO
         wPZLUjtPb6Qdn/UD3a+a+ObkRK2W3wANiAtg+oMoiUWSWIAW7s+tiLS+C5er537s9/od
         mRQg==
X-Gm-Message-State: AOAM5315VfGlsylr8o9HGqV7p6gNQR5/WYjjXWXE1Yl5ubRMnPShCNDW
        DQxd73GlMGyr12ci91t02w==
X-Google-Smtp-Source: ABdhPJyw2cjiz04Vl4DlvrU3cwBlg7+DslpHmlBuvmJuxSQy2fZDpW50Db/BYzeqQzzFQUqSJMu3hw==
X-Received: by 2002:a4a:ab0c:: with SMTP id i12mr1342573oon.24.1631042897722;
        Tue, 07 Sep 2021 12:28:17 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id c14sm2582754otd.62.2021.09.07.12.28.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Sep 2021 12:28:16 -0700 (PDT)
Received: (nullmailer pid 205682 invoked by uid 1000);
        Tue, 07 Sep 2021 19:28:15 -0000
Date:   Tue, 7 Sep 2021 14:28:15 -0500
From:   Rob Herring <robh@kernel.org>
To:     Fengquan Chen <Fengquan.Chen@mediatek.com>
Cc:     randy.wu@mediatek.com, Rob Herring <robh+dt@kernel.org>,
        linux-watchdog@vger.kernel.org, rex-bc.chen@mediatek.com,
        Guenter Roeck <linux@roeck-us.net>, christine.zhu@mediatek.com,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, zhishuang.zhang@mediatek.com,
        fengquan.chen@mediatek.com, tinghan.shen@mediatek.com,
        joe.yang@mediatek.com
Subject: Re: [v2,2/2] dt-bindings: watchdog: mtk-wdt: add disable_wdt_extrst
 support
Message-ID: <YTe9T/oqpwN5CHKR@robh.at.kernel.org>
References: <20210903061623.10715-1-Fengquan.Chen@mediatek.com>
 <20210903061623.10715-3-Fengquan.Chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210903061623.10715-3-Fengquan.Chen@mediatek.com>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, 03 Sep 2021 14:16:23 +0800, Fengquan Chen wrote:
> This patch add a description and example of disable_wdt_extrst
> element for watchdog on MTK Socs
> 
> Signed-off-by: fengquan.chen <fengquan.chen@mediatek.com>
> ---
>  Documentation/devicetree/bindings/watchdog/mtk-wdt.txt | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
