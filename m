Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AEF1B1C265F
	for <lists+linux-watchdog@lfdr.de>; Sat,  2 May 2020 16:57:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728150AbgEBO53 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 2 May 2020 10:57:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728035AbgEBO53 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 2 May 2020 10:57:29 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F1E5C061A0C;
        Sat,  2 May 2020 07:57:29 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id x6so131515plv.8;
        Sat, 02 May 2020 07:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=QrYGAubEqwzwquEx2Edm3lavoI+/qX4M+pQUcvGXV3k=;
        b=rwUbEm8fJxYa7XPiUO1hiUeffwIxNZeLcFogdB3FKp/ZKfQi4oj2O30BKaysbmJlIS
         JGYhw6tErSrCNfF48haZ3cdJZogupZ0zVdACzUYz2zN8aLVz0ApDi8furMwpLbcl3kPh
         6m74rJ9q/KuF7SoAQH2Y8fI3pjjfzMgy5FENDASYtX9tmW6XUGrDZfpgWciAfcSuNP7F
         fLBMsGoAoN3lfS6C5UeERbXsDeobfrBaxjqSRq17Xc2K54yBSCDXkO9dSb5lQFkFDKsl
         PMFlVzK21TkFszxatPdOZT4Y3JfTTEWCRGsBb3zkR3cS7F/FLKAxk/GU1UNiNnMCKnM5
         t22A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=QrYGAubEqwzwquEx2Edm3lavoI+/qX4M+pQUcvGXV3k=;
        b=gjFbKMdHTp5O1nMvyJAEvYHhVls9S81AsaHTjI+HremoHSwSM7Vz8bFMdYsA/MUG2d
         3uVCbkAAiwgtjxrYiE2SFy8Ph5L20Fs9pWZ6NIsINuf02/SZQTFy6js+xiDvasMpqlOC
         jLgW6WcTP865rOnrSE80jT34TEw/r+kGlNODNKVXB8wBpCZni5fU+msH5P/TZjYU/4QS
         LpJlt2WvBqR0G8/tQZSA3Zwtm6PdsuLfkvA3DjgyIrQ1Atv1me3QUnswhckINwpGLF62
         PuyYtLVhSlFqJTbFBgUc6CImzzzM2UQiZifqPStfRR/H93OLH11XNLNLt5BiEYecpTeS
         PN8Q==
X-Gm-Message-State: AGi0Puae4qBiVDyllBQ+/t9Xk43lWdmkbpnP2m/fBqi7KpF7HrQ7zWiS
        hdfpM/ny68/VaxEMeTlXtWI=
X-Google-Smtp-Source: APiQypJRcYlpEamSKIPjDruICLkC9LSfCv1GeaaAxuLu2XII+vnw7iOyL6HjBPzp3bDfruTknAyqdQ==
X-Received: by 2002:a17:902:8643:: with SMTP id y3mr9469004plt.149.1588431448743;
        Sat, 02 May 2020 07:57:28 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id u3sm4693033pfb.105.2020.05.02.07.57.28
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 02 May 2020 07:57:28 -0700 (PDT)
Date:   Sat, 2 May 2020 07:57:27 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     linux-kernel@vger.kernel.org, kernel@pengutronix.de,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] watchdog: imx2_wdt: update contact email
Message-ID: <20200502145727.GE189389@roeck-us.net>
References: <20200502142653.19144-1-wsa@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200502142653.19144-1-wsa@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Sat, May 02, 2020 at 04:26:53PM +0200, Wolfram Sang wrote:
> The 'pengutronix' address is defunct for years. Use the proper contact
> address.
> 
> Signed-off-by: Wolfram Sang <wsa@kernel.org>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/imx2_wdt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/imx2_wdt.c b/drivers/watchdog/imx2_wdt.c
> index 1fe472f56cb3..b84f80f7d342 100644
> --- a/drivers/watchdog/imx2_wdt.c
> +++ b/drivers/watchdog/imx2_wdt.c
> @@ -2,7 +2,7 @@
>  /*
>   * Watchdog driver for IMX2 and later processors
>   *
> - *  Copyright (C) 2010 Wolfram Sang, Pengutronix e.K. <w.sang@pengutronix.de>
> + *  Copyright (C) 2010 Wolfram Sang, Pengutronix e.K. <kernel@pengutronix.de>
>   *  Copyright (C) 2014 Freescale Semiconductor, Inc.
>   *
>   * some parts adapted by similar drivers from Darius Augulis and Vladimir
> -- 
> 2.20.1
> 
