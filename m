Return-Path: <linux-watchdog+bounces-4896-lists+linux-watchdog=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ELKiMXKIgmn/VwMAu9opvQ
	(envelope-from <linux-watchdog+bounces-4896-lists+linux-watchdog=lfdr.de@vger.kernel.org>)
	for <lists+linux-watchdog@lfdr.de>; Wed, 04 Feb 2026 00:44:50 +0100
X-Original-To: lists+linux-watchdog@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 34B22DFD08
	for <lists+linux-watchdog@lfdr.de>; Wed, 04 Feb 2026 00:44:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 133873016EEA
	for <lists+linux-watchdog@lfdr.de>; Tue,  3 Feb 2026 23:44:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9C4D330333;
	Tue,  3 Feb 2026 23:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ugcyN0Rq"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96BA3324B1D
	for <linux-watchdog@vger.kernel.org>; Tue,  3 Feb 2026 23:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770162280; cv=none; b=CSMDmsXWoxrAfyV4l4BaE/Bo1lVt19oXErogsOsfOc68Spv/+weLfl2ibqIwiUOQfN56kVRNmg7Kr4nb4Gn25Ccr9e7r/EdcpcekrynYN7oRDBIb7iMs8l19hX2Y8XP8Et3szAlu09y7Sd8sK5jKzfUq+CvDcwrnB1amVTVwbn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770162280; c=relaxed/simple;
	bh=MUtAEzuFZ3UXsgeYeGcULd0s9lsr291/wS31tUAYPQI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PkQL90Z8x3jMzJvpM3L1iCk3+wUcY3A1jFWYSiXFoaUMJZ8aP7RMq6mebXTeeEX3vCETt6PWMRm620SeBGJMx5h1XvThlC8bhKvZaauTfvZRpUXPI5/Lyvf1cccBBBHTWoG6aAFFcS5WNR3ADDYzruRjFroMUASWhOOckzeZDOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ugcyN0Rq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BD54C2BCB1
	for <linux-watchdog@vger.kernel.org>; Tue,  3 Feb 2026 23:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770162280;
	bh=MUtAEzuFZ3UXsgeYeGcULd0s9lsr291/wS31tUAYPQI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ugcyN0RqC48lMQVC290mr54/cSG8mF5qG6qEw1bXtuEg1AHRMdgpEol4MTB4WYgbx
	 2xgqlBNWqkJckBepT2lyA7KPKwAVTR7exlJt6+nKU49bLYyk6a32A0JXHEgkYdX0JW
	 JdKy89rOSuHUxQGG36O3GomJnrxi8DRpkj9qqaL1u59b5X03z9pAKndSF27sExk6Mu
	 e+wEhvO8nkNb10Lh7E62jU/jKYzK+2n8Cn3jkoSu8teRtumFaYuuD7lBca1tjzvYHH
	 DNwMUzf8L2cy3eu0zdga38VJVA/+z07Ak3oWCQxVORf+z7cadCUrLBIMwDdqHvpyx/
	 3Nl558QdYMMaA==
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-649bd1f08acso276715d50.1
        for <linux-watchdog@vger.kernel.org>; Tue, 03 Feb 2026 15:44:40 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXNyuPE1JTtLb7wfIXHgW5yCgltqLDO7iblj1W+ccNVyZngQ8aTftRgmDSg7dRpzGvczASu0pLKGzuobfNc9w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+MxbP4CwfU0kC7xL/QXs/h317H/m+qORAoDCS+SN43e1vUuNv
	vC/DTBqB8TXcrYU59xYDcWB5BAX6DtY6hNLmoTMXTKh87ZQWdXlYyu+rmjl34sBC9a8HxhGQTzG
	x25znjL2FFxWbL8/1SpuPE/x+cGCaDK8=
X-Received: by 2002:a53:d8c6:0:b0:645:68cf:2bf4 with SMTP id
 956f58d0204a3-649db4ac96bmr877835d50.77.1770162279637; Tue, 03 Feb 2026
 15:44:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260203-dev-b4-aaeon-mcu-driver-v3-0-0a19432076ac@bootlin.com> <20260203-dev-b4-aaeon-mcu-driver-v3-4-0a19432076ac@bootlin.com>
In-Reply-To: <20260203-dev-b4-aaeon-mcu-driver-v3-4-0a19432076ac@bootlin.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 4 Feb 2026 00:44:27 +0100
X-Gmail-Original-Message-ID: <CAD++jLmsx885MteExK0NcS6aD3BVimK82Z3bosSpUvSs8p4Cag@mail.gmail.com>
X-Gm-Features: AZwV_QjuysNBoHyalaty048gguXHT55tueRC1-zJSip9FADgZXaoN46HJGRIgaE
Message-ID: <CAD++jLmsx885MteExK0NcS6aD3BVimK82Z3bosSpUvSs8p4Cag@mail.gmail.com>
Subject: Re: [PATCH v3 4/5] gpio: aaeon: Add GPIO driver for SRG-IMX8P MCU
To: "Thomas Perrot (Schneider Electric)" <thomas.perrot@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, 
	=?UTF-8?B?SsOpcsOpbWllIERhdXRoZXJpYmVz?= <jeremie.dautheribes@bootlin.com>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, Lee Jones <lee@kernel.org>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-watchdog@vger.kernel.org, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-4896-lists,linux-watchdog=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,pengutronix.de,gmail.com,bootlin.com,linux-watchdog.org,roeck-us.net,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-watchdog@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-watchdog,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 34B22DFD08
X-Rspamd-Action: no action

On Tue, Feb 3, 2026 at 5:21=E2=80=AFPM Thomas Perrot (Schneider Electric)
<thomas.perrot@bootlin.com> wrote:

> Add GPIO driver for the Aaeon SRG-IMX8P embedded controller. This
> driver supports 7 GPO (General Purpose Output) pins and 12 GPIO pins
> that can be configured as inputs or outputs.
>
> The driver implements proper state management for GPO pins (which are
> output-only) and full direction control for GPIO pins. During probe,
> all pins are reset to a known state (GPOs low, GPIOs as inputs) to
> prevent undefined behavior across system reboots, as the MCU does not
> reset GPIO states on soft reboot.
>
> Co-developed-by: J=C3=A9r=C3=A9mie Dautheribes (Schneider Electric) <jere=
mie.dautheribes@bootlin.com>
> Signed-off-by: J=C3=A9r=C3=A9mie Dautheribes (Schneider Electric) <jeremi=
e.dautheribes@bootlin.com>
> Signed-off-by: Thomas Perrot (Schneider Electric) <thomas.perrot@bootlin.=
com>

Looks good to me!

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

