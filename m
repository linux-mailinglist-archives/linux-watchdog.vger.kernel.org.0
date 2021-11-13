Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 650F144F3EE
	for <lists+linux-watchdog@lfdr.de>; Sat, 13 Nov 2021 16:24:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235977AbhKMP1P (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 13 Nov 2021 10:27:15 -0500
Received: from rosenzweig.io ([138.197.143.207]:48402 "EHLO rosenzweig.io"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235974AbhKMP1N (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 13 Nov 2021 10:27:13 -0500
Date:   Sat, 13 Nov 2021 10:24:14 -0500
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
Message-ID: <YY/YnlCxLqdw/zAo@sunset>
References: <20211113094732.73889-1-sven@svenpeter.dev>
 <20211113094732.73889-2-sven@svenpeter.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211113094732.73889-2-sven@svenpeter.dev>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

> + * This HW block has three separate watchdogs. WD0 resets the machine
> + * to recovery mode and is not very useful for us. WD1 and WD2 trigger a normal
> + * machine reset. WD0 additionally supports a configurable interrupt.

Do we have any idea what the difference between WD1 and WD2 is?
