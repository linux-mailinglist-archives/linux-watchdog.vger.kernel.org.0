Return-Path: <linux-watchdog+bounces-2734-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F990A15C87
	for <lists+linux-watchdog@lfdr.de>; Sat, 18 Jan 2025 12:45:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A912916773A
	for <lists+linux-watchdog@lfdr.de>; Sat, 18 Jan 2025 11:45:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 394A81885B3;
	Sat, 18 Jan 2025 11:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jXz5Tw1I"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74B3D10E3;
	Sat, 18 Jan 2025 11:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737200751; cv=none; b=T14P3vkMzEDe0zoN2NasnhvsAEuHDCvZB3bNLoKZ1LSQ8yObd/5Q/5ohTpP8BWCqFbhZWnlmjVW2Mcc2AllkR03zdjD+ej+5ahhJd+FzUrqd5Nn0n64sMw7mmP0Nx+OP/zRct7dYgRzThidbV//d4SI6h8OfW+29BB8FgwjUxn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737200751; c=relaxed/simple;
	bh=f4siNjxgX/mbNjfLS/32dwy0S7rCc9EgFpXIlQwRUq0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AyZrtJGkjORwjwRO1gXt22xqHJmyAcNq2iRJCf2genn5387Ydt4CpWxWnlr9BDma9+1e2ajf/LQ3bRgqebG/mLZRr6qy06P0+PT7GogXOxYZWaQ5bT49rFtRxIUv++Ym12QGV/pvW6MpLxsuqEcz2L3umtSxX1jED6+hdhFQBCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jXz5Tw1I; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-aaf57c2e0beso605965066b.3;
        Sat, 18 Jan 2025 03:45:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737200748; x=1737805548; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f4siNjxgX/mbNjfLS/32dwy0S7rCc9EgFpXIlQwRUq0=;
        b=jXz5Tw1I/eHXRA3l/pAXHl91ZNo4/02fMZt9NdBG/cysEC4v96gAMGvi6X9Edr2nCp
         Mm1QkN7OY3tzSr3w4d3bFixHG8nQgVzmug/b6JIrYBMnGpQC1rUeZSCYrzYb/bsH6lWi
         G5PdMsmzdm7dq5fqqXzYdoph2X63qipcU6Yh/xwOx8OozHBrA3x4HM0cj5ws2H0In5w3
         ppkubvgU6VNJqVnnzS1VUDIHcLh1v/LR5OMqRG0Kuas8ouv5kf/0oJMSW1U7+6V1paFX
         RIl8TOVFHkGeZpMyJNatHC01FrEqx9DFjtvUMN1xNYnxu+BBHUE3KPDPwrYYNginiSoF
         1JzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737200748; x=1737805548;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f4siNjxgX/mbNjfLS/32dwy0S7rCc9EgFpXIlQwRUq0=;
        b=kRaVQE2vu4qB5G2x3RxqWPyfAM+Xi82zxfFn+g8l4fJrA9z9oLZO0Y3cx4OJhN1oMF
         /PVAi58P1nyn1hzcWs4ez33/Q0R9sB9volK2cTRj06/YGXsKnmgfiMSfPwn4JJNpUQsu
         W90zwaZIZoFi/vKz1JOhtKscVGcWAhAGxqrMdyuzCbPawXxhOkPT6PW6D4RKyfev56Yc
         jbvnSYnzCQGxbNrGROG9JrC/v4TML++TTLIhoga0Per1sOttqNt69Y6NFEhBIAeZxSwd
         YbB8pcP7xozCp1CabeA5u5JEosb6yEkAfT97Pa2WUEokmDeAuzFAw3ac1esgKeHtJPfm
         edUQ==
X-Forwarded-Encrypted: i=1; AJvYcCUPTOk2F75epoFIiE9RDrowVmnKBShl5EE+/U/b/RZIc1Nsq8m4hJGYX7/ZnYpIBHYP6NWZYpgS6dNyk68=@vger.kernel.org, AJvYcCVmp50GFuPa8RHlhodYfCpNrOMa968c0s2f0GLaYAfxHafaeJ9ClV1QwWwlr4pt3NWMWvazaYhG2yXGeMg8Svc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxB3GavoeIcaVGW5+N8wW11JiOExglBT3OVFtbAiB2Jxmzr5r6T
	wHhJ0KfWyW6NtLf2rNXRfNpxTHGNt1e8CNmUBknrnsQSl/JLCkd/
X-Gm-Gg: ASbGncuhls4erIYfd9ueC6DDmOSEdx0eHCBwfnY/NBSpyUoQZYNS+TG6Y10ev2G26eX
	NsJFzQ2RfqF/vTDy802WMZFPLuRhyX82mDUQeWIQTH01l2exrdqY7t6JfOgQxeimwsfEB0Elzsg
	p4GGNySPrO6AmiWS2QGFvbh8GjfCNWjjTR9+tEEivt/CKqi1hUDY7r2alZxckj4xzVljolOWOKG
	cOCz62xUTuMMhyQ3VfjZoXCyO0LfQCi48qzoswtGbGP7JKteaZIDR8bEVy4EyF6OjP6+JjmarqI
	82P9P8bIhWIndTw=
X-Google-Smtp-Source: AGHT+IEc/dxl1rTjiPZX3AO03wqpI1sxEn2EWC5g3utoZzcrir3URb2QTl/gt3l1bSP0pp4nc7Kr4Q==
X-Received: by 2002:a17:907:1c2a:b0:aac:832:9bf7 with SMTP id a640c23a62f3a-ab38b27be47mr527318766b.24.1737200747437;
        Sat, 18 Jan 2025 03:45:47 -0800 (PST)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab384fce6c6sm326568166b.179.2025.01.18.03.45.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jan 2025 03:45:47 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>, Andre Przywara <andre.przywara@arm.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-watchdog@vger.kernel.org
Subject: Re: [PATCH 04/14] watchdog: sunxi_wdt: Add support for Allwinner A523
Date: Sat, 18 Jan 2025 12:45:45 +0100
Message-ID: <2417745.NG923GbCHz@jernej-laptop>
In-Reply-To: <20241111013033.22793-5-andre.przywara@arm.com>
References:
 <20241111013033.22793-1-andre.przywara@arm.com>
 <20241111013033.22793-5-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne ponedeljek, 11. november 2024 ob 02:30:23 Srednjeevropski standardni =
=C4=8Das je Andre Przywara napisal(a):
> The Allwinner A523 SoC comes with a watchdog very similar to the ones in
> the previous Allwinner SoCs, but oddly enough moves the first half of its
> registers up by one word. Since we have different offsets for these
> registers across the other SoCs as well, this can simply be modelled by
> just stating the new offsets in our per-SoC struct.
> The rest of the IP is the same as in the D1, although the A523 moves its
> watchdog to a separate MMIO frame, so it's not embedded in the timer
> anymore. The driver can be ignorant of this, because the DT will take
> care of this.
>=20
> Add a new struct for the A523, specifying the SoC-specific details, and
> tie the new DT compatible string to it.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



