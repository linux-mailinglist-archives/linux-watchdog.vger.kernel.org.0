Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8F4F816AF24
	for <lists+linux-watchdog@lfdr.de>; Mon, 24 Feb 2020 19:30:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727426AbgBXSaf (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 24 Feb 2020 13:30:35 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:46217 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726652AbgBXSaf (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 24 Feb 2020 13:30:35 -0500
Received: by mail-pf1-f195.google.com with SMTP id k29so5757854pfp.13;
        Mon, 24 Feb 2020 10:30:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=pq6GSAYK4H+W5Z/lzKiek5aeX7rqYiIt2+bcNZslLYg=;
        b=eUBBV9tDY7yrhSRonCgvwzq/NRJKstkC56R2Cay6ne8H1xuRDdGKapCQE6oWy29RLr
         ZYIthA3p2vhOiUbAhDEIkJAxj9FdltuD0qfP+q3/LcU2jV6+3oXsSFBXrjhiPvfsdW4z
         sBkMe1JOSnfrzLLpPeGL9Xh6eDKyrZ+F3ptPWbU/VzlLBzrJ4Cq9mNxGVVIqdoDBHHIf
         tSMUqoSe422VQt/QN4XpBBlXWhx3mJnVhzLJ0lHb8e3R2s/0tbMOdJBkpiV9coZaUmRW
         oCpNryodOkfIWY0MNaSD5pTMIapa6Rh6j7+GD5FO7MJ9PRyjTqxO6iqlvKP/aWvLJPI5
         poWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to:user-agent;
        bh=pq6GSAYK4H+W5Z/lzKiek5aeX7rqYiIt2+bcNZslLYg=;
        b=kJeIlgd1zOBjtcCOrq72Rpiwob0imJgatjwHPT4C1H52xTQOVZENbpW6Wh7jH+jBeh
         9EqCqUcsG5mi8N5rp+fwMRY0akzNmFlLIKR/HXcizhQzuFzLH0zvjiEidxoH0YUWMZpM
         2Rdj9z240boHfaRkguYLQbCayOtfsE4CBnbdL2Pwk8E63eo0VHCFN+RuaOeC/cSzxG/o
         G42YzNsKP8kHa/xnCJMD9Bd2kfCRfc75HVmPm03lT6slKh/B+EOpH/efvTSYQncVNJet
         fUoxivW0fKjtvO9iOJLCFTwD3c08H2TsVeOUpjPj2mtvOeybZZ9G4qjKEqPVIfwk51uh
         +pMQ==
X-Gm-Message-State: APjAAAW52R9zX6IfKygyCiCIYw0nHiLJLsRRcYvKmmaEjitsZE08cbJC
        F7VY+gFS+lWbc98Jx6vS9lU=
X-Google-Smtp-Source: APXvYqw/0Z2SLf81F4zyq2z7mcNTzqNfLuTdXhEIPM14gzPyWllaLcP2ZXtrATAvk2samENioENhng==
X-Received: by 2002:a62:5447:: with SMTP id i68mr53703624pfb.44.1582569035022;
        Mon, 24 Feb 2020 10:30:35 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id b98sm167511pjc.16.2020.02.24.10.30.34
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Feb 2020 10:30:34 -0800 (PST)
Date:   Mon, 24 Feb 2020 10:30:33 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Anson Huang <anson.huang@nxp.com>,
        "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: Re: [PATCH] watchdog: imx2_wdt: Drop .remove callback
Message-ID: <20200224183033.GB29799@roeck-us.net>
References: <1582512687-13312-1-git-send-email-Anson.Huang@nxp.com>
 <20200224102211.clzqw4vtzc4nz5df@pengutronix.de>
 <DB3PR0402MB391637EB54A1FD37059FBE47F5EC0@DB3PR0402MB3916.eurprd04.prod.outlook.com>
 <33c3778f-fc7e-8564-f767-91aafae03122@roeck-us.net>
 <20200224182522.33qeusb4xbxxt3o3@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200224182522.33qeusb4xbxxt3o3@pengutronix.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Mon, Feb 24, 2020 at 07:25:22PM +0100, Uwe Kleine-König wrote:
> On Mon, Feb 24, 2020 at 06:15:17AM -0800, Guenter Roeck wrote:
> > How would you expect the watchdog core to stop the watchdog
> > with no stop function in the driver ?
> 
> I'm not 100% sure, but I think the situation is that you cannot stop the
> watchdog in the watchdog register range, but if you stop the clock it
> will never expire.
> 
> That's why I asked if the devm action callback stops the watchdog.
> 

Again, it should not be possible to unload the driver if the watchdog
is running.

Guenter
