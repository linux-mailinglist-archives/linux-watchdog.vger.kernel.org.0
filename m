Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D25EA192E1
	for <lists+linux-watchdog@lfdr.de>; Thu,  9 May 2019 21:25:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726721AbfEITZO (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 9 May 2019 15:25:14 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:46441 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726683AbfEITZN (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 9 May 2019 15:25:13 -0400
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <ukl@pengutronix.de>)
        id 1hOofH-00022h-NH; Thu, 09 May 2019 21:25:11 +0200
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <ukl@pengutronix.de>)
        id 1hOofH-0007UA-0k; Thu, 09 May 2019 21:25:11 +0200
Date:   Thu, 9 May 2019 21:25:10 +0200
From:   Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org, kernel@pengutronix.de
Subject: Re: What to set in struct watchdog_device::bootstatus?
Message-ID: <20190509192510.m6o7d63u7e4fs22h@pengutronix.de>
References: <20190208105230.g33nxiu4r6uqech3@pengutronix.de>
 <f9ec94d7-8365-e733-81ff-34c501cce89a@roeck-us.net>
 <20190220201408.gcgsg43uonwc4ucs@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190220201408.gcgsg43uonwc4ucs@pengutronix.de>
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-watchdog@vger.kernel.org
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hello Guenter,

On Wed, Feb 20, 2019 at 09:14:08PM +0100, Uwe Kleine-König wrote:
> In a custom kernel patch stack I found a patch that uses (apart from
> WDIOF_CARDRESET also) WDIOF_POWERUNDER and WDIOF_EXTERN1 to
> differentiate the different reset causes. Now that you told using this
> is wrong, I wonder how these are supposed to be used instead; and there
> are a few more that according to
> Documentation/watchdog/watchdog-kernel-api.txt might be used to set
> bootstatus. Are these a relic? What do these signal?

I'm still interested in an answer here. While it is currently not
possible to "fix" the custom kernel as some other software that is
already shipping depends on this. Still I'd like to know the details
here to maybe suggest an alternative for the longterm future.

> IMHO there is a patch opportunity waiting to improve the documenation
> :-) Or maybe even change watchdog_get_status() to ensure that only
> WDIOF_CARDRESET, WDIOF_MAGICCLOSE and WDIOF_KEEPALIVEPING can be set?

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
