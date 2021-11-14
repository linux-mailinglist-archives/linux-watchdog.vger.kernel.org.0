Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B94244F827
	for <lists+linux-watchdog@lfdr.de>; Sun, 14 Nov 2021 14:45:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235827AbhKNNsj (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 14 Nov 2021 08:48:39 -0500
Received: from rosenzweig.io ([138.197.143.207]:48428 "EHLO rosenzweig.io"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233638AbhKNNsh (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 14 Nov 2021 08:48:37 -0500
Date:   Sun, 14 Nov 2021 08:18:16 -0500
From:   Alyssa Rosenzweig <alyssa@rosenzweig.io>
To:     Sven Peter <sven@svenpeter.dev>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Hector Martin <marcan@marcan.st>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Kettenis <mark.kettenis@xs4all.nl>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] watchdog: Add Apple SoC watchdog driver
Message-ID: <YZEMmH49D+GZEewi@sunset>
References: <20211113094732.73889-1-sven@svenpeter.dev>
 <20211113094732.73889-2-sven@svenpeter.dev>
 <YY/YnlCxLqdw/zAo@sunset>
 <95dea968-f452-4ba0-9b66-c9bc4269a52c@www.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <95dea968-f452-4ba0-9b66-c9bc4269a52c@www.fastmail.com>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

> >> + * This HW block has three separate watchdogs. WD0 resets the machine
> >> + * to recovery mode and is not very useful for us. WD1 and WD2 trigger a normal
> >> + * machine reset. WD0 additionally supports a configurable interrupt.
> >
> > Do we have any idea what the difference between WD1 and WD2 is?
> 
> I've never seen macOS write to WD2 when running in our hypervisor and only
> found that one when I was looking at the rest of the MMIO region.
> >From what I can tell it works exactly like WD1.

Makes sense, thanks.
