Return-Path: <linux-watchdog+bounces-697-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FFEE85D764
	for <lists+linux-watchdog@lfdr.de>; Wed, 21 Feb 2024 12:49:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E4E1FB248A2
	for <lists+linux-watchdog@lfdr.de>; Wed, 21 Feb 2024 11:49:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC5E43F9C8;
	Wed, 21 Feb 2024 11:49:05 +0000 (UTC)
X-Original-To: linux-watchdog@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E307A446DE
	for <linux-watchdog@vger.kernel.org>; Wed, 21 Feb 2024 11:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708516145; cv=none; b=isJRougVzo/bSI0s8BUjNRszdXAf9osCye+mCU3ANXaIVt0GgmQdhxP+izAVUpJmt1K1ZIjbvUH3Fhpqg0wWQOahLTgFvc+m929Me7VkfaJv+IsF/0OV/csgEPL+gkeDxMcrUkD1P5QB5AgsJQbOXR88jsenOb/OKlKP30X6/NE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708516145; c=relaxed/simple;
	bh=MqAtX4r3evQnuc0+Z+SGH7wwaQmeoU0VpHKlY7UeihQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=e/qZGUpsJ9GJIZVReECNo+5AkQrQlZhO/SyYlgjRngNcT2574EdFEOnzJxu5JBZ7aFET9qS2vH3HtjJeaUnqxagKoqPFCZcxhcYEThiwVbHiX8G4kMUWPcmi3TRxt7uIRnAXs/4EpYjnFN7ZitR6nP7oXs8uPuxJfY5LIjzAhn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1rcl5k-0003zo-5c; Wed, 21 Feb 2024 12:48:48 +0100
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1rcl5i-0021w0-CM; Wed, 21 Feb 2024 12:48:46 +0100
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1rcl5i-0006MR-10;
	Wed, 21 Feb 2024 12:48:46 +0100
Message-ID: <7c3246e94de0fdad3f9bed50d46f70327ef30ef9.camel@pengutronix.de>
Subject: Re: [PATCH v2 1/2] watchdog: sp805_wdt: deassert the reset if
 available
From: Philipp Zabel <p.zabel@pengutronix.de>
To: forbidden405@outlook.com, Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>,  Viresh Kumar <vireshk@kernel.org>
Cc: linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Date: Wed, 21 Feb 2024 12:48:46 +0100
In-Reply-To: <20240220-hisi-wdt-v2-1-63edc4965b4c@outlook.com>
References: <20240220-hisi-wdt-v2-0-63edc4965b4c@outlook.com>
	 <20240220-hisi-wdt-v2-1-63edc4965b4c@outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-watchdog@vger.kernel.org

On Di, 2024-02-20 at 02:14 +0800, Yang Xiwen via B4 Relay wrote:
> From: Yang Xiwen <forbidden405@outlook.com>
>=20
> According to the datasheet, the core has an WDOGRESn input signal that
> needs to be deasserted before being operational. Implement it in the
> driver.
>=20
> Signed-off-by: Yang Xiwen <forbidden405@outlook.com>
> ---
>  drivers/watchdog/sp805_wdt.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>=20
> diff --git a/drivers/watchdog/sp805_wdt.c b/drivers/watchdog/sp805_wdt.c
> index 2756ed54ca3d..b4bcfdeb39e6 100644
> --- a/drivers/watchdog/sp805_wdt.c
> +++ b/drivers/watchdog/sp805_wdt.c
> @@ -25,6 +25,7 @@
>  #include <linux/moduleparam.h>
>  #include <linux/pm.h>
>  #include <linux/property.h>
> +#include <linux/reset.h>
>  #include <linux/slab.h>
>  #include <linux/spinlock.h>
>  #include <linux/types.h>
> @@ -59,6 +60,7 @@
>   * @lock: spin lock protecting dev structure and io access
>   * @base: base address of wdt
>   * @clk: (optional) clock structure of wdt
> + * @rst: (optional) reset control signal of wdt
>   * @rate: (optional) clock rate when provided via properties
>   * @adev: amba device structure of wdt
>   * @status: current status of wdt
> @@ -69,6 +71,7 @@ struct sp805_wdt {
>  	spinlock_t			lock;
>  	void __iomem			*base;
>  	struct clk			*clk;
> +	struct reset_control		*rst;

This can be a local variable in sp805_wdt_probe().

>  	u64				rate;
>  	struct amba_device		*adev;
>  	unsigned int			load_val;
> @@ -264,6 +267,12 @@ sp805_wdt_probe(struct amba_device *adev, const stru=
ct amba_id *id)
>  		return -ENODEV;
>  	}
> =20
> +	wdt->rst =3D devm_reset_control_get_optional(&adev->dev, NULL);

Please use devm_reset_control_get_optional_exclusive() directly.

> +	if (IS_ERR(wdt->rst))
> +		return dev_err_probe(&adev->dev, PTR_ERR(wdt->rst), "Can not get reset=
\n");
> +
> +	reset_control_deassert(wdt->rst);
> +
>  	wdt->adev =3D adev;
>  	wdt->wdd.info =3D &wdt_info;
>  	wdt->wdd.ops =3D &wdt_ops;

regards
Philipp

