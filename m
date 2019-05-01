Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CEA6710DCE
	for <lists+linux-watchdog@lfdr.de>; Wed,  1 May 2019 22:13:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726088AbfEAUND (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 1 May 2019 16:13:03 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:46074 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726077AbfEAUND (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 1 May 2019 16:13:03 -0400
Received: by mail-ot1-f66.google.com with SMTP id a10so58049otl.12;
        Wed, 01 May 2019 13:13:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Jd1WFvY6vXO7XfCF+c2Cho4laj+45+LGc52UGSOL454=;
        b=OaiLNVA0XK4vSFhc243yEWEVfMLqZgB+0NWmQz7zOwDblwkEISp/Zbhd8QxLKPY75O
         XZWrVl4k1xh8zemdx1be2GXWhVAH6dqS18jbBWxEAz0sSrdMnV11VfYQMt0NjX4/DpoI
         3P4qg1VJ/u9ndC3UKwXo5oMTg/2kRlScbe3ifaLmd2tVfXUztB0gla1hvICM+3quj1mL
         AsszzwzzWJkgC4MC56jPsOSYI0ZjVxqswKKAaPwvr/boCzQ1YXi7+FStIXj9nC/g3x3+
         s8JL9tTBE8GtSyKTop4r80RGVYTYwsv9DKwn1hHkdo50wl3lQfqS/ND+/jOfuRex72Zy
         YgkQ==
X-Gm-Message-State: APjAAAWRmys428K9sMjCvx9j+6Hw8pkIsvtl6Ts8QkkWx1cbM5jhgqQD
        WcJW4NmiUO/S9Xyxy8lYdQ==
X-Google-Smtp-Source: APXvYqxADl/71OMLKkk8hcK2ifMcCTcMNV9ChiXtbLjzAeL1AP7BH1TBc0wF1XoqAnVF8KKqFTYPeg==
X-Received: by 2002:a9d:19ed:: with SMTP id k100mr8627234otk.214.1556741582508;
        Wed, 01 May 2019 13:13:02 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id h24sm15854390otr.39.2019.05.01.13.13.00
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 01 May 2019 13:13:01 -0700 (PDT)
Date:   Wed, 1 May 2019 15:13:00 -0500
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
        Peng Fan <peng.fan@nxp.com>,
        Daniel Baluta <daniel.baluta@nxp.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: Re: [PATCH V2 4/4] dt-bindings: watchdog: remove i.MX system
 controller watchdog
Message-ID: <20190501201300.GA13176@bogus>
References: <1556421727-7401-1-git-send-email-Anson.Huang@nxp.com>
 <1556421727-7401-4-git-send-email-Anson.Huang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1556421727-7401-4-git-send-email-Anson.Huang@nxp.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Sun, Apr 28, 2019 at 03:27:17AM +0000, Anson Huang wrote:
> i.MX system controller watchdog now depends on SCU driver, so it
> needs to be subnode of SCU node in DT, binding doc is moved to
> fsl,scu.txt as well.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> ---
> New patch.
> ---
>  .../bindings/watchdog/fsl-imx-sc-wdt.txt           | 24 ----------------------
>  1 file changed, 24 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/watchdog/fsl-imx-sc-wdt.txt

This should probably just be part of patch 1 to be clear you are moving 
things.
