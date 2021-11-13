Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D0D844F2BC
	for <lists+linux-watchdog@lfdr.de>; Sat, 13 Nov 2021 12:24:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232925AbhKML1H (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 13 Nov 2021 06:27:07 -0500
Received: from soltyk.jannau.net ([144.76.91.90]:54798 "EHLO soltyk.jannau.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231735AbhKML1H (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 13 Nov 2021 06:27:07 -0500
X-Greylist: delayed 602 seconds by postgrey-1.27 at vger.kernel.org; Sat, 13 Nov 2021 06:27:06 EST
Received: by soltyk.jannau.net (Postfix, from userid 1000)
        id 11E04261AB8; Sat, 13 Nov 2021 12:14:11 +0100 (CET)
Date:   Sat, 13 Nov 2021 12:14:11 +0100
From:   Janne Grunau <j@jannau.net>
To:     Sven Peter <sven@svenpeter.dev>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Hector Martin <marcan@marcan.st>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Kettenis <mark.kettenis@xs4all.nl>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] watchdog: Add Apple SoC watchdog driver
Message-ID: <20211113111410.GB10073@jannau.net>
References: <20211113094732.73889-1-sven@svenpeter.dev>
 <20211113094732.73889-2-sven@svenpeter.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211113094732.73889-2-sven@svenpeter.dev>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 2021-11-13 10:47:32 +0100, Sven Peter wrote:
> Add support for the watchdog timer found in Apple SoCs. This driver is
> also required to reboot these machines.

Tested on a M1 Max with
compatibe = "apple,t6000-wdt", "apple,wdt";
MacOS 12 on the same machine does not use the watchdog for reset. MacOS 
log output suggests that it uses a "pgmr" call for reset.

Feel free to add
Tested-by: Janne Grunau <j@jannau.net>

Janne
