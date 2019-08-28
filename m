Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 345E69FCBA
	for <lists+linux-watchdog@lfdr.de>; Wed, 28 Aug 2019 10:18:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726339AbfH1ISX (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 28 Aug 2019 04:18:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:39948 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726292AbfH1ISX (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 28 Aug 2019 04:18:23 -0400
Received: from localhost (lfbn-1-17395-211.w86-250.abo.wanadoo.fr [86.250.200.211])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 310E82189D;
        Wed, 28 Aug 2019 08:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1566980302;
        bh=+pPMLUCSSxO28zMU47W0EaRFagvxicZdMQed3gzfifw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=09CmK50HCvij31BRxh1M3vSf9K8uw68/0d/d5eMMsCOfA6A9Pbp7INvd1tMHJg7nu
         pvbxHaI4GFBWa/xBBLz7LAsxuA+8PaEk8PSl0DRtAAVMoJ6YdYrBxVU+RvOOUMMhOS
         vt8f/iHOhmY5YghwX2M2lOmhLJkRIKLPNgFxtkk0=
Date:   Wed, 28 Aug 2019 10:18:19 +0200
From:   Maxime Ripard <mripard@kernel.org>
To:     linux@roeck-us.net, wim@linux-watchdog.org
Cc:     linux-kernel@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-watchdog@vger.kernel.org
Subject: Re: [PATCH RESEND v2 1/6] dt-bindings: watchdog: Add YAML schemas
 for the generic watchdog bindings
Message-ID: <20190828081819.qqztieg7cgdvpkxv@flea>
References: <20190821143835.7294-1-mripard@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="i6iaeebbwmfsnvrm"
Content-Disposition: inline
In-Reply-To: <20190821143835.7294-1-mripard@kernel.org>
User-Agent: NeoMutt/20180716
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org


--i6iaeebbwmfsnvrm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 21, 2019 at 04:38:30PM +0200, Maxime Ripard wrote:
> From: Maxime Ripard <maxime.ripard@bootlin.com>
>
> The watchdogs have a bunch of generic properties that are needed in a
> device tree. Add a YAML schemas for those.
>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>

Ping?

Maxime


--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--i6iaeebbwmfsnvrm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXWY4ywAKCRDj7w1vZxhR
xSrsAP9Wm4uqadS7xrVp8WfRQCHb46bRTlF+qGXNnJAoK7xrlwEAnhNhZ4zOZeDd
sjEXxaKnIq1SiINnOpEsBy21a+L8eAY=
=fuF4
-----END PGP SIGNATURE-----

--i6iaeebbwmfsnvrm--
