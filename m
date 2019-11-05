Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 924FEF0277
	for <lists+linux-watchdog@lfdr.de>; Tue,  5 Nov 2019 17:19:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389986AbfKEQTJ (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 5 Nov 2019 11:19:09 -0500
Received: from Galois.linutronix.de ([193.142.43.55]:41956 "EHLO
        Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389760AbfKEQTJ (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 5 Nov 2019 11:19:09 -0500
Received: from bigeasy by Galois.linutronix.de with local (Exim 4.80)
        (envelope-from <bigeasy@linutronix.de>)
        id 1iS1Xu-0007eB-Iv; Tue, 05 Nov 2019 17:19:06 +0100
Date:   Tue, 5 Nov 2019 17:19:06 +0100
From:   Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-watchdog@vger.kernel.org,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Steffen Trumtrar <s.trumtrar@pengutronix.de>,
        Tim Sander <tim@krieglstein.org>,
        Julia Cartwright <julia@ni.com>,
        Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH] watchdog: prevent deferral of watchdogd wakeup on RT
Message-ID: <20191105161906.xdva2nuuif2cy3i2@linutronix.de>
References: <20191105144506.clyadjbvnn7b7b2m@linutronix.de>
 <20191105160250.GA16663@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20191105160250.GA16663@roeck-us.net>
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 2019-11-05 08:02:50 [-0800], Guenter Roeck wrote:
> > Acked-by: Guenter Roeck <linux@roeck-us.net>
> > [bigeasy: use only HRTIMER_MODE_REL_HARD]
> > Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> 
> Looks ok for mainline.

Good. HRTIMER_MODE_REL_HARD is mainline this time.

> Reviewed-by: Guenter Roeck <linux@roeck-us.net>

thanks. I kept/added your Acked-by from last time.

Sebastian
