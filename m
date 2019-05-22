Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AB980261C5
	for <lists+linux-watchdog@lfdr.de>; Wed, 22 May 2019 12:32:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728952AbfEVKcv convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 22 May 2019 06:32:51 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:41051 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728438AbfEVKcu (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 22 May 2019 06:32:50 -0400
Received: from localhost (lfbn-1-10718-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        (Authenticated sender: maxime.ripard@bootlin.com)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 2CD6924000B;
        Wed, 22 May 2019 10:32:43 +0000 (UTC)
Date:   Wed, 22 May 2019 12:32:43 +0200
From:   Maxime Ripard <maxime.ripard@bootlin.com>
To:     =?utf-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Chen-Yu Tsai <wens@csie.org>, linux-watchdog@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/5] dt-bindings: watchdog: add Allwinner H6 r_watchdog
Message-ID: <20190522103243.mmrfato5p2mhtf4j@flea>
References: <20190521160330.28402-1-peron.clem@gmail.com>
 <20190521160330.28402-4-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8BIT
In-Reply-To: <20190521160330.28402-4-peron.clem@gmail.com>
User-Agent: NeoMutt/20180716
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Tue, May 21, 2019 at 06:03:28PM +0200, Clément Péron wrote:
> Allwinner H6 has a second watchdog on the r-blocks which is
> compatible with the A31.
>
> This commit add the H6 compatible for the r_watchdog.
>
> Signed-off-by: Clément Péron <peron.clem@gmail.com>

Unless you have some evidence that the two blocks are different, then
you should just reuse the same one.

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
