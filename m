Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 03ACB1B9EC
	for <lists+linux-watchdog@lfdr.de>; Mon, 13 May 2019 17:26:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731138AbfEMP0b (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 13 May 2019 11:26:31 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:37182 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727458AbfEMP0b (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 13 May 2019 11:26:31 -0400
Received: by mail-ot1-f67.google.com with SMTP id r10so11389222otd.4;
        Mon, 13 May 2019 08:26:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=nIvktfd4Hu4J+EanMaRcVbjL4KHwX8r4JOA04Ck3E04=;
        b=Hkk8Nsb7hKIC2XFypkOJ+NTeBHPRV5M1j4o/SsS/Uld3iYc269r+WzYYPysGv3z/NK
         p5OBnYsklBHyhOrrQ1aJc7CKrESB+Tr0T62P5yDXhAte64UzEc/tbX5dGn8ovE11+ePX
         RQ4ZY8DbopY02xKZ2kztuCQg1MzpWRsADFB5wl4NJEQxDMdpfIDQy+eesS7G5blItYmC
         Q7J/U/DS1YA3thfXpuH40w5s3QE13+Zmc8lxJn35DrW5bKH14O+wJdHsEwi8QOeEWZXM
         VqXlIniAIzn33nyPPCjKvvo0Wki8/JFqbFMahLzaYj1rTHJy5PK0nqhEtdupuoE/LdxN
         Y+tg==
X-Gm-Message-State: APjAAAU0ir/UMiKCXlbfhtsI9Od87PrmbnMyuLdJc6l8FyO/WGaExV7j
        Xi0YdfJ1otR9srHAOYO8Nw==
X-Google-Smtp-Source: APXvYqzOz0IJhiSIHUggaPIhdUeY+8qUhUMxIUjErgTOEdtsFRFR0DWcAUAIS2pzGbes4imV56PH3w==
X-Received: by 2002:a9d:12d7:: with SMTP id g81mr11173627otg.46.1557761190168;
        Mon, 13 May 2019 08:26:30 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id r15sm2003876oie.5.2019.05.13.08.26.29
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 May 2019 08:26:29 -0700 (PDT)
Date:   Mon, 13 May 2019 10:26:28 -0500
From:   Rob Herring <robh@kernel.org>
To:     Anson Huang <anson.huang@nxp.com>
Cc:     "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
        "linux@roeck-us.net" <linux@roeck-us.net>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>,
        Peng Fan <peng.fan@nxp.com>,
        Daniel Baluta <daniel.baluta@nxp.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: Re: [PATCH V4 1/3] dt-bindings: watchdog: move i.MX system
 controller  watchdog binding to SCU
Message-ID: <20190513152628.GA28757@bogus>
References: <1557192198-19640-1-git-send-email-Anson.Huang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1557192198-19640-1-git-send-email-Anson.Huang@nxp.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Tue, 7 May 2019 01:28:12 +0000, Anson Huang wrote:
> i.MX system controller watchdog depends on SCU driver to support
> interrupt function, so it needs to be subnode of SCU node in DT,
> binding doc should be moved to fsl,scu.txt as well.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> ---
> No change.
> ---
>  .../devicetree/bindings/arm/freescale/fsl,scu.txt  | 15 ++++++++++++++
>  .../bindings/watchdog/fsl-imx-sc-wdt.txt           | 24 ----------------------
>  2 files changed, 15 insertions(+), 24 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/watchdog/fsl-imx-sc-wdt.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
