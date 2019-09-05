Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1C1AEAA6BD
	for <lists+linux-watchdog@lfdr.de>; Thu,  5 Sep 2019 17:06:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390203AbfIEPGE (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 5 Sep 2019 11:06:04 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:40172 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390198AbfIEPGE (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 5 Sep 2019 11:06:04 -0400
Received: by mail-pf1-f195.google.com with SMTP id x127so1935464pfb.7;
        Thu, 05 Sep 2019 08:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=AguZPT09i2MW35dbWpY+fBOKGp/0MXMj2MJKZ8LdyJ8=;
        b=VFslLs1i8f06aUrJwS01nIMEgRk3Rl3SjvLT4LD4jPEvm5GXr9kfykPeN9F0boLKsT
         A3vmAWLlujE6HxFNVDbWOH3pTjWRd4cWwS+E4DxuFE64aPSUnh/Cqn0CZAfR2LGaWP90
         12MtvyoG8+isQMd+2A/Do/GnSshj8qx3jYfD+JhbjNHyD8cX/Di11PgF8bWI6W2L0pPZ
         +pSUW1s78oFfd0M9fZC9d1N1CY+gR2Vkfg6Lgw6Wv5CmRfYxyauIXaIZmixVJCd4Yh/A
         Wps3iM+rXAQcgvQIE1V9LKEOwWCb2faSiTk1WNgVhQbuuzB/C0OwEk5+3LNhmC48MGcQ
         OrtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=AguZPT09i2MW35dbWpY+fBOKGp/0MXMj2MJKZ8LdyJ8=;
        b=PqiSuExAszbFgk2utQYbiXJBRdFJehxxd5Lohn/WuVhAAn9JwY2gxhsRDi4LijfiTp
         ZicuyD0DoRwf2mbraMHGEvpPOIRMd0nrNdG7u4HBmn0XlvbdudWEa4o1xugQsdqtYwPH
         3BAVlAIQj+A+eIOyu3Pwcx7fOkXeFb9lNOY0qKXGI8Wiq5+Qky3N22ldAenO+Yr44RjE
         ciCoGwCqubyDzske+M+USouc4Upn9m0s9b6I8XsJqoRt9ZOVWUFXklArs0nd+E7XvPx5
         UIsNuJGrtLUc9fpLBhjLlJJwD/ghCW8iAV+D8ApruCn5b4JFzE3TRzF6bJeOwlNaByXM
         owpg==
X-Gm-Message-State: APjAAAU1oqXYw7RXtyE07B5ZDWKVIp+8IPqwsY07DtTVotI7LRLHmUa5
        YMrJtLLy78qzztTOHqA2Aqc=
X-Google-Smtp-Source: APXvYqztlYN0ZDJF90oIdvXI+2P9lqKmStMU6OPQj+evEMLtfg4OiL2LGHi4NayJqGLlwismBhjBbA==
X-Received: by 2002:a63:5c7:: with SMTP id 190mr3485618pgf.67.1567695963182;
        Thu, 05 Sep 2019 08:06:03 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id j18sm3524705pfh.70.2019.09.05.08.06.00
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 05 Sep 2019 08:06:01 -0700 (PDT)
Date:   Thu, 5 Sep 2019 08:06:00 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Oliver Graute <oliver.graute@kococonnector.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        Daniel Baluta <daniel.baluta@nxp.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>
Subject: Re: [PATCH v1] watchdog: imx_sc: this patch just fixes whitespaces
Message-ID: <20190905150600.GA18080@roeck-us.net>
References: <20190905073730.22258-1-oliver.graute@kococonnector.com>
 <016e268c-f289-4127-a47e-3d8faa790ded@roeck-us.net>
 <20190905143525.GE23537@optiplex>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190905143525.GE23537@optiplex>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Thu, Sep 05, 2019 at 02:35:37PM +0000, Oliver Graute wrote:
> On 05/09/19, Guenter Roeck wrote:
> > On 9/5/19 12:44 AM, Oliver Graute wrote:
> > > Fix only whitespace errors in imx_sc_wdt_probe()
> > > 
> > > Signed-off-by: Oliver Graute <oliver.graute@kococonnector.com>
> > 
> > This patch no longer applies due to commit "watchdog: imx_sc: Remove
> > unnecessary error log".
> > 
> 
> ok I'll rebase patch against linux-staging/watchdog-next
> 
I should have said "no longer necessary". The mentioned patch
makes the same change (and drops the error message).

Guenter
