Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF4142DA3C0
	for <lists+linux-watchdog@lfdr.de>; Mon, 14 Dec 2020 23:58:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2441234AbgLNW4Q (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 14 Dec 2020 17:56:16 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:44357 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2441243AbgLNW4L (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 14 Dec 2020 17:56:11 -0500
Received: by mail-oi1-f196.google.com with SMTP id d189so21129395oig.11;
        Mon, 14 Dec 2020 14:55:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Bit7ziA6HeSaOdhpmx8q59hTwt6FMYGB0HNYpOxOcVU=;
        b=CaWRJqQCkbs+gaKitWUnbgBxbxS3Bt6Q/P8Mfr0IsDTTbX+bNVG8ntPHSoM4Z9jRy4
         6joQyDaT1j2oNv+FIXKs+6ngRUqKeOT8yp4dBRTMmHf4YL6ajs1H4DQluahvcZdqa6Nj
         NfSWJIKDWmJ6JclYM5KZx5TtryX4zpHQ9i6vdOWb7V1yZar4qF3nB0XCD+0gdyyEs2gR
         j7/RtnRv59M+dJZf0roDCVwriTDCl177ujJsdELpap8xzJrQzEFXMGBVJ2u9oluSWysn
         w2FuG2gVI64sHgUVhae8gujGIxi9zkYyoxYQSwzPglgCVF3FLyjMKh3tnRJLOPxsMpOm
         dt9g==
X-Gm-Message-State: AOAM5312LpSZSufDCw/b+p5G7UDleybPeL4bdMHEivim3JxfQ4SeA87r
        RGXefFFMJ5PDZH/wVU8fRg==
X-Google-Smtp-Source: ABdhPJwGZwf48PbHeFXODr1tfn9rIqVN/+4N5j+fiA8m54iPdD8NCo5O8o3x8KIdojDze0iGxBgi/A==
X-Received: by 2002:aca:c5c8:: with SMTP id v191mr14942760oif.67.1607986530226;
        Mon, 14 Dec 2020 14:55:30 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id q4sm4254206ooo.1.2020.12.14.14.55.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Dec 2020 14:55:29 -0800 (PST)
Received: (nullmailer pid 2535435 invoked by uid 1000);
        Mon, 14 Dec 2020 22:55:27 -0000
Date:   Mon, 14 Dec 2020 16:55:27 -0600
From:   Rob Herring <robh@kernel.org>
To:     Andre Przywara <andre.przywara@arm.com>
Cc:     Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <mripard@kernel.org>,
        Icenowy Zheng <icenowy@aosc.xyz>, linux-sunxi@googlegroups.com,
        Shuosheng Huang <huangshuosheng@allwinnertech.com>,
        Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
        linux-watchdog@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Yangtao Li <tiny.windzz@gmail.com>,
        =?iso-8859-1?Q?Cl=E9ment_P=E9ron?= <peron.clem@gmail.com>
Subject: Re: [PATCH v2 17/21] dt-bindings: watchdog: sun4i: Add H616
 compatible string
Message-ID: <20201214225527.GA2535405@robh.at.kernel.org>
References: <20201211011934.6171-1-andre.przywara@arm.com>
 <20201211011934.6171-18-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201211011934.6171-18-andre.przywara@arm.com>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, 11 Dec 2020 01:19:30 +0000, Andre Przywara wrote:
> Use enums to group all compatible devices together on the way.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  .../bindings/watchdog/allwinner,sun4i-a10-wdt.yaml   | 12 +++++-------
>  1 file changed, 5 insertions(+), 7 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
