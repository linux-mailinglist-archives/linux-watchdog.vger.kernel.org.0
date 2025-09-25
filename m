Return-Path: <linux-watchdog+bounces-4274-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BD37B9EEC2
	for <lists+linux-watchdog@lfdr.de>; Thu, 25 Sep 2025 13:34:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E077019C8658
	for <lists+linux-watchdog@lfdr.de>; Thu, 25 Sep 2025 11:34:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 249E62FB0B0;
	Thu, 25 Sep 2025 11:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PsHBGqDM"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECAC02FB088;
	Thu, 25 Sep 2025 11:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758800062; cv=none; b=aWF8kX5V/Fm4Hn9uSWruFcaTZDgzy8RpvH0V2SI48XBUx5q0NJqvY6n8TNBtylGaRmZzY3rrEFoLhoGbZFH1xLfDM4zINclOGXTaFxvrnASi76rv4rsKk7ZeBdhfV4Z1/ydRnDk/qrUZ7yiW1fQh+FMrQ9irqFN91EzmA81XZfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758800062; c=relaxed/simple;
	bh=ToDFatLMxcooz/Q3OYrcJoGIlf1v4yNR2bbGcNdcIJs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MecnDCmaglHFuei4SZ1mwQaZKwXSuGNpaA4F85q1Ss96Y/owQA5N+Eg1IQYMr6WriDB8+dqZLb5i+pc9Y2VczwH0XZ6hlZcaDqaDZC1V6FPvbwCl9GWXpRkwYanU6cm8Lrmw9l2JfWK+SRTdTzYUPady8fILcCgo7BhnXbhHXN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PsHBGqDM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C66BC113CF;
	Thu, 25 Sep 2025 11:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758800061;
	bh=ToDFatLMxcooz/Q3OYrcJoGIlf1v4yNR2bbGcNdcIJs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PsHBGqDMQeIX4YknUdxKSPDWqGcUvidkg+rT540MJzLhQSdpux4mJa/btTSTwxr0p
	 42LyXcB0+KTzq/K/X9BCrQaa1MPQn+CwIPIF1EN5iJVSCCwArllqj6nxYe0C4ikM5b
	 UMCNH3nznG1dlWbuoqVSgntdCF8tMRG2ORBeQHmvpOhIukEM9keS81o7gBMXFVRZ/X
	 UqRFpiN2/rBanaJtrsv92V6k1cfowhkzD0TxlZGdCPhUNQaldY/6LGMdpuKohlv+by
	 jXbzkUQIKj5LhrDFx87CgkDyYNXnaWqYRpDztgs1sPac+fuC9QOexsgYCncSRQMUwm
	 a+qdOhj0hTNqw==
Date: Thu, 25 Sep 2025 12:34:15 +0100
From: Lee Jones <lee@kernel.org>
To: Michael Walle <mwalle@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-watchdog@vger.kernel.org, Andrew Davis <afd@ti.com>,
	Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Srinivas Kandagatla <srini@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>
Subject: Re: [PATCH v2 0/7] Initial Kontron SMARC-sAM67 support
Message-ID: <20250925113415.GD8757@google.com>
References: <20250912120745.2295115-1-mwalle@kernel.org>
 <DD1PD807DBY9.2FY81JFZ6EDAE@kernel.org>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DD1PD807DBY9.2FY81JFZ6EDAE@kernel.org>

On Thu, 25 Sep 2025, Michael Walle wrote:

> Hi Lee,
> 
> On Fri Sep 12, 2025 at 2:07 PM CEST, Michael Walle wrote:
> > Now that the PMIC support is there, we can finally, upstream the
> > support for this board. Besides the usual device tree, this
> > patchset contains the support for the on-board house keeping MCU. It
> > make extensive reuse of the drivers for the former SMARC-sAL28
> > board. Besides different hwmon sensors, all the dt binding patches
> > will just add a board specific compatible (in addition to the old
> > sl28 compatible) to make any future board specific quirks possible.
> >
> > I'm aware that there is a patch [1] which moves the sl28cpld MFD
> > schema to a different directory. Once that patch is merged, I'll
> > repost this series. But I already want to get some early feedback.
> >
> > v2:
> >  - dropped patches which were already picked up
> >  - new patch "dt-bindings: mfd: tps6594: allow gpio-line-names"
> >  - separate driver for the hwmon, add missing hwmon documentation,
> >    thanks Guenter
> >  - split the DT as suggested by the SoC maintainers
> >  - add missing copyright and license to the overlays, thanks Andrew
> >
> > Michael Walle (7):
> >   dt-bindings: arm: ti: Add Kontron SMARC-sAM67 module
> >   dt-bindings: mfd: tps6594: allow gpio-line-names
> >   arm64: dts: ti: Add support for Kontron SMARC-sAM67
> >   dt-bindings: hwmon: sl28cpld: add sa67mcu compatible
> >   dt-bindings: watchdog: add SMARC-sAM67 support
> >   hwmon: add SMARC-sAM67 support
> >   arm64: dts: ti: sa67: add on-board management controller node
> 
> Would you take these two patches
>     dt-bindings: mfd: tps6594: allow gpio-line-names
>     dt-bindings: watchdog: add SMARC-sAM67 support
> 
> through the MFD tree this cycle? If they make it in, there wouldn't
> be any more dependencies for the next cycle for the actual device
> tree.

Applied both, thanks.

-- 
Lee Jones [李琼斯]

