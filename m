Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 88A5F2A0BF
	for <lists+linux-watchdog@lfdr.de>; Fri, 24 May 2019 23:56:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404352AbfEXV4A (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 24 May 2019 17:56:00 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:40580 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404259AbfEXV4A (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 24 May 2019 17:56:00 -0400
Received: by mail-ot1-f67.google.com with SMTP id u11so10005466otq.7;
        Fri, 24 May 2019 14:56:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=rzmGBtS7uiLRgw/6pyzECaIphdLrdhzZOh5FaNXwiJI=;
        b=Te/unnYMzeuErFTY9v16S3rIZPqNeEnH9lGHuDfHg4gs/fFhudsoG5DxmvKf+Hs5wr
         Mo3+UP6Hf1ZAd3gDVYEDFiMqlxu8CB6oo2L884rkl66T5b4mvIsxD89etP9R7mnsdlzN
         /FZzR57X6rZp+NSL4VzvszLumj/sy9767ryPvXXMzG5sCye8uKLVW3SZo4+yO/o6d2Yc
         QAOkjcVAhyHdPRxmrB/7Z5s/GyU3t3iIWbZVFlpEdYsw7zBjyzEPm1/HqHf/L76zfBSs
         kjRo5ogE5+T48Uep6UEBQ+DpFLZOz42S2712xQZ7Rx2FLRBG+kQccqvdSPwIuRO16SYQ
         70/Q==
X-Gm-Message-State: APjAAAW1DlVtn0eS1PJ73RbMd4VJOwpFAYPGpo5j0tgbQ+gueYblMTDw
        0/+2HoGA05l0y0xImK/uCj3MwD8=
X-Google-Smtp-Source: APXvYqyCJiUto5HfEn+a7kKZSGr9NjKSLt9LpOJbgGJtDGcUpjszm71EQRQThbLn9a3jeJS/KxFfsA==
X-Received: by 2002:a9d:70d2:: with SMTP id w18mr35402otj.289.1558734959743;
        Fri, 24 May 2019 14:55:59 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id k139sm1480211oib.11.2019.05.24.14.55.59
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 May 2019 14:55:59 -0700 (PDT)
Date:   Fri, 24 May 2019 16:55:58 -0500
From:   Rob Herring <robh@kernel.org>
To:     =?iso-8859-1?Q?Cl=E9ment_P=E9ron?= <peron.clem@gmail.com>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Mark Rutland <mark.rutland@arm.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>, linux-watchdog@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        =?iso-8859-1?Q?Cl=E9ment_P=E9ron?= <peron.clem@gmail.com>
Subject: Re: [PATCH v5 1/4] dt-bindings: watchdog: add Allwinner H6 watchdog
Message-ID: <20190524215558.GA14313@bogus>
References: <20190523151050.27302-1-peron.clem@gmail.com>
 <20190523151050.27302-2-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190523151050.27302-2-peron.clem@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Thu, 23 May 2019 17:10:47 +0200, =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= wrote:
> Allwinner H6 has a similar watchdog as the A64 which is already
> a compatible of the A31.
> 
> This commit add the H6 compatible.
> 
> Signed-off-by: Clément Péron <peron.clem@gmail.com>
> ---
>  Documentation/devicetree/bindings/watchdog/sunxi-wdt.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
