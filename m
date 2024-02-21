Return-Path: <linux-watchdog+bounces-702-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 871B385D7E6
	for <lists+linux-watchdog@lfdr.de>; Wed, 21 Feb 2024 13:29:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 33D13282E46
	for <lists+linux-watchdog@lfdr.de>; Wed, 21 Feb 2024 12:29:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F074551C30;
	Wed, 21 Feb 2024 12:29:15 +0000 (UTC)
X-Original-To: linux-watchdog@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1532B4E1A8
	for <linux-watchdog@vger.kernel.org>; Wed, 21 Feb 2024 12:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708518555; cv=none; b=d295nyDjneO+NI5P+H73a2vI8iK0GzrHnly+z4luP/So7XP99gUekY4tyVZjYAZ9+ptKmVzW3TqDyXlq6DwojquToEjrIwKz3IS+BpZ4vVWhULNmXHSjr0KVT7sZ1PsKIjIzX+vtHLAFXqhQgfMF9ZvKxaAMqlViGGuUFHl3v3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708518555; c=relaxed/simple;
	bh=i7x1ydrz3cbt7Ni3188JEFCNDYRhNl0E4xbcGnSvR7o=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Q5p6lWmNjDQt9u+nsy5oPsLeE1NuosbXOBIBFeB9xdMI4Xtdyb0dPDwTF42Ug7r4WLx4XAbTxziS3jUPcJcd81xJ1EiKOh/A4HBj7uOoz0wMLxbxZbQTGIRQCi7bJ+R7j0gENalPp9m0tJdeTuJKbkvAZUBWIozppQQQij8sQ9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1rclib-0001Wa-FI; Wed, 21 Feb 2024 13:28:57 +0100
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1rclia-0022Lk-Do; Wed, 21 Feb 2024 13:28:56 +0100
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1rclia-0007Qt-1B;
	Wed, 21 Feb 2024 13:28:56 +0100
Message-ID: <ca0c0955df301b28d26ead4da27f48296fef640a.camel@pengutronix.de>
Subject: Re: [PATCH v3 1/2] watchdog: sp805_wdt: deassert the reset if
 available
From: Philipp Zabel <p.zabel@pengutronix.de>
To: forbidden405@outlook.com, Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>,  Viresh Kumar <vireshk@kernel.org>
Cc: linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Date: Wed, 21 Feb 2024 13:28:56 +0100
In-Reply-To: <20240221-hisi-wdt-v3-1-9642613dc2e6@outlook.com>
References: <20240221-hisi-wdt-v3-0-9642613dc2e6@outlook.com>
	 <20240221-hisi-wdt-v3-1-9642613dc2e6@outlook.com>
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

On Mi, 2024-02-21 at 19:56 +0800, Yang Xiwen via B4 Relay wrote:
> From: Yang Xiwen <forbidden405@outlook.com>
>=20
> According to the datasheet, the core has an WDOGRESn input signal that
> needs to be deasserted before being operational. Implement it in the
> driver.
>=20
> Signed-off-by: Yang Xiwen <forbidden405@outlook.com>

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp

