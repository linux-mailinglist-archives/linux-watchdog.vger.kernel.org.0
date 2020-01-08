Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B7552133DAC
	for <lists+linux-watchdog@lfdr.de>; Wed,  8 Jan 2020 09:56:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727112AbgAHI4h (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 8 Jan 2020 03:56:37 -0500
Received: from mail-qt1-f194.google.com ([209.85.160.194]:40202 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726921AbgAHI4g (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 8 Jan 2020 03:56:36 -0500
Received: by mail-qt1-f194.google.com with SMTP id v25so351902qto.7
        for <linux-watchdog@vger.kernel.org>; Wed, 08 Jan 2020 00:56:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=23UaZlNsApqhumDDLUOyVqHmZXSwjOyNRAB7ikWfhfk=;
        b=dt29E8cPCpwAonKSxaiv3VaP8BgaW6t7bbMQkQnM0D3acz6OORwBCcouS6gD45iHNu
         GoPZetsVGj8l0OnJGPxqVSmqzq56aVUI+0uLD7j+Gg9OKKkLy6E736TS9AFewSX5PE6+
         AOSxXDvApaNRuUXWC+iSUIvKTYYK+4hSDeiCc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=23UaZlNsApqhumDDLUOyVqHmZXSwjOyNRAB7ikWfhfk=;
        b=Ve1PEGsAc6RfNX9iKFPW6ql5SFMPfDVpGiVyORR0BzSlgSuY+JTjLN8SnXhjYxusfO
         JQcahtH9iYXvUOdVnGOhi63RzT1dnmxtUH9dg5C6qJSpW+MmJYn48OyBQI5pvM/OuSCs
         ca+hzLoYvmBoW6Ecb3Zga+laeBTHq0tP4MQ9VFmZBmBll9mRxmddm+/y1GdoRoIMbtlt
         IqOhNgVHgtReSnmFtK2RZ9wdLxXEraKO9hPaMB21ZQIuQUPnD/BlYBRDUvrvZ17pWSkU
         S6tdEQtK+Qt+7aRWsTPetBhwSWBHTKMCgvxfEGVhinz+v/VQClNv1wXKXzPIXpN5tO+T
         rVMA==
X-Gm-Message-State: APjAAAVdeWPvaKYnkHNfR48dVDdkKeiWu6UXHWx0TPLfgW2Wm8oJhWiN
        FHlNXry+53oOCodV8ybz4qeUB+GFcRCuU8CrFpDrqQ==
X-Google-Smtp-Source: APXvYqwLdC1bnpk+yFSSUDDZwVNj0SEXt8iwYqeuRY98reHyPr1olVJxIKDeEhuHBiSIek43xvF7qoUS3R03lEt//CI=
X-Received: by 2002:ac8:3946:: with SMTP id t6mr2632345qtb.278.1578473795857;
 Wed, 08 Jan 2020 00:56:35 -0800 (PST)
MIME-Version: 1.0
References: <20191227141405.3396-1-yong.liang@mediatek.com> <20191227141405.3396-2-yong.liang@mediatek.com>
In-Reply-To: <20191227141405.3396-2-yong.liang@mediatek.com>
From:   Nicolas Boichat <drinkcat@chromium.org>
Date:   Wed, 8 Jan 2020 16:56:25 +0800
Message-ID: <CANMq1KD=jAPn4Y7zQZrsg9FB7Cq6tNX0R8OF4qX21Sjy2=0Naw@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] amr64: dts: modify mt8183.dtsi
To:     Yong Liang <yong.liang@mediatek.com>
Cc:     Matthias Brugger <matthias.bgg@gmail.com>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Devicetree List <devicetree@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>, wim@linux-watchdog.org,
        linux@roeck-us.net, linux-watchdog@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

minor nit, s/amr64/arm64/ in the commit title.

On Fri, Dec 27, 2019 at 10:15 PM Yong Liang <yong.liang@mediatek.com> wrote:
>
> From: "yong.liang" <yong.liang@mediatek.com>
>
> 1. Include mt8183-reset.h and add reset-cells in infracfg
> in dtsi file
> 2. Add watchdog device node
>
> Signed-off-by: yong.liang <yong.liang@mediatek.com>

Tested-by: Nicolas Boichat <drinkcat@chromium.org>

> ---
>  arch/arm64/boot/dts/mediatek/mt8183.dtsi | 8 ++++++++
>  1 file changed, 8 insertions(+)
> [snip]
