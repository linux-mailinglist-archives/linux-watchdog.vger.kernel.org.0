Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 884EB1BB92
	for <lists+linux-watchdog@lfdr.de>; Mon, 13 May 2019 19:12:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731252AbfEMRMn (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 13 May 2019 13:12:43 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:36288 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728268AbfEMRMn (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 13 May 2019 13:12:43 -0400
Received: by mail-oi1-f194.google.com with SMTP id l203so9947108oia.3;
        Mon, 13 May 2019 10:12:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=7aH9jvyj8udQuEfouTqfiJHkI2TFZzZb0Nr6TJxC7VU=;
        b=PrMAilIhaCyBdGKdOwwjVJsFK2eiIYDzfst8ZJxI7p7eo/z5ibQ8Rt/EXqfJh90dG1
         ugyo+DenyTGvfkqf3o8nVNHN/jNrZmlY/9r6ZItOoeORP8d19Nd96vCczcea3p3t5xWu
         /56lXSDbY4QTfo230ohvOZpnbgsyNknFyvVuOTKLgUxm4RfuIJtnKfPdlGV47Mog78I/
         65Ob6B/42L0xHEYk++YTKkaaxoOuABowAY7yVfM19czEjaixstA3PFsqhCUveT/oSFOK
         slplN3ab+m05vrqZt+RuY5BMzB2Y6fmK9J/AODz8LoPdQj8tj/gTczbnyq7kB247j4ha
         Mi/A==
X-Gm-Message-State: APjAAAWNxSdpr+wjzGAfM6cQ/sHrnzNSpE8uJl8lZj3NgUpZKwxoxnhJ
        GdTSxX0GlYtc93fjxpXZ6A==
X-Google-Smtp-Source: APXvYqzx0hbsH195gGOUH61bHHIWmSjYVkgvwfe3nu0ASG3GjUxd0M0QZ3R4ZRdXoB8EiRT+xFWECA==
X-Received: by 2002:aca:b5c3:: with SMTP id e186mr136171oif.134.1557767562137;
        Mon, 13 May 2019 10:12:42 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id h3sm5249765otl.32.2019.05.13.10.12.41
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 May 2019 10:12:41 -0700 (PDT)
Date:   Mon, 13 May 2019 12:12:40 -0500
From:   Rob Herring <robh@kernel.org>
To:     Anson Huang <anson.huang@nxp.com>
Cc:     "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
        "linux@roeck-us.net" <linux@roeck-us.net>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>,
        Daniel Baluta <daniel.baluta@nxp.com>,
        Peng Fan <peng.fan@nxp.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: Re: [PATCH RESEND V4 1/3] dt-bindings: watchdog: move i.MX system
 controller watchdog binding to SCU
Message-ID: <20190513171240.GA15603@bogus>
References: <1557655528-12816-1-git-send-email-Anson.Huang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1557655528-12816-1-git-send-email-Anson.Huang@nxp.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Sun, May 12, 2019 at 10:10:30AM +0000, Anson Huang wrote:
> i.MX system controller watchdog depends on SCU driver to support
> interrupt function, so it needs to be subnode of SCU node in DT,
> binding doc should be moved to fsl,scu.txt as well.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> ---
> No change, just resend patch with correct encoding.

Quoted-printable isn't really correct either. It should be 7-bit or 
8-bit if UTF-8.

> ---
>  .../devicetree/bindings/arm/freescale/fsl,scu.txt  | 15 ++++++++++++++
>  .../bindings/watchdog/fsl-imx-sc-wdt.txt           | 24 ----------------------
>  2 files changed, 15 insertions(+), 24 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/watchdog/fsl-imx-sc-wdt.txt

Reviewed-by: Rob Herring <robh@kernel.org>
