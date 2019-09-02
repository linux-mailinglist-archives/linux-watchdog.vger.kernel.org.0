Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C503CA5539
	for <lists+linux-watchdog@lfdr.de>; Mon,  2 Sep 2019 13:47:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730538AbfIBLqy (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 2 Sep 2019 07:46:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:57304 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731082AbfIBLqx (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 2 Sep 2019 07:46:53 -0400
Received: from localhost (smbhubinfra01.hotspot.hub-one.net [213.174.99.146])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 78E502173E;
        Mon,  2 Sep 2019 11:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1567424813;
        bh=3AeKxO0ddoJuqHSrvWoZKyJIKicbcRXMYvMJTXIXUkk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=NOMkxTlpJiSLb1t19p8ePomtZzXLnK4x7mAVZFT8P7TxQHbZFafWmBozeYUnuejtq
         /eOWS2ZMDmVO8GQXvizOvHzE6hm6197vIi4dqfTSIv0d20lU7Z+FLnZdxIbxoOTY9g
         3PAH/y/1afdQCcMAszgWphcDBNYpBesP/6mPdFb0=
Date:   Mon, 2 Sep 2019 13:46:50 +0200
From:   Maxime Ripard <mripard@kernel.org>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     wim@linux-watchdog.org, linux-kernel@vger.kernel.org,
        Chen-Yu Tsai <wens@csie.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-watchdog@vger.kernel.org
Subject: Re: [PATCH RESEND v2 1/6] dt-bindings: watchdog: Add YAML schemas
 for the generic watchdog bindings
Message-ID: <20190902114650.w65ya7mgfsyu275x@flea>
References: <20190821143835.7294-1-mripard@kernel.org>
 <20190830164811.GA7911@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190830164811.GA7911@roeck-us.net>
User-Agent: NeoMutt/20180716
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi Guenther,

On Fri, Aug 30, 2019 at 09:48:11AM -0700, Guenter Roeck wrote:
> On Wed, Aug 21, 2019 at 04:38:30PM +0200, Maxime Ripard wrote:
> > From: Maxime Ripard <maxime.ripard@bootlin.com>
> >
> > The watchdogs have a bunch of generic properties that are needed in a
> > device tree. Add a YAML schemas for those.
> >
> > Reviewed-by: Rob Herring <robh@kernel.org>
> > Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
>
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>

Thanks for reviewing this, which tree should this go through? Yours or Rob's?

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
