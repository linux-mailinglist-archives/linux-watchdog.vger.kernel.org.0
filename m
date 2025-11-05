Return-Path: <linux-watchdog+bounces-4514-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 03571C3531C
	for <lists+linux-watchdog@lfdr.de>; Wed, 05 Nov 2025 11:47:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DC8F7192277A
	for <lists+linux-watchdog@lfdr.de>; Wed,  5 Nov 2025 10:46:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3DF12C237C;
	Wed,  5 Nov 2025 10:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="SyAF3mbx"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AEFB2E4279;
	Wed,  5 Nov 2025 10:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762339568; cv=none; b=J7ySvF8kTqGCIzzfw3M/nCaUQs0drdUU8NdK5mb3HfhzI7AUjRwO0NnVW7RgbeZcaKnXunsS/U0GawbLrvrqAfBTl1hbnNmGCoRqs6SDe6SCHYZ7MrJ9U85FPZc9NoAMJUJAAds1K4VJMAor32jBdxbxiRv8WWeTm/hzGDDd3ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762339568; c=relaxed/simple;
	bh=KM0SK+z9pPR60LL6PZEVNU3j/vWMZTs4GdNGNT+Y7Kg=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=ImvLqTFHNFRebGBjGyC5eQXuvrpOLrcMk37u/F2KW+74xkZk6bluXb7PyrCfa+XZXs4ifnv/MU3YI22Tr/NMt4lv7ilogOFvYBj/Tfsk/+bnZVlOVB90AVI2x0afEnkXGv/x8Q+o/D2dce0A3Uu57oOEQEC30YLYrVcXMRqBa6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=SyAF3mbx; arc=none smtp.client-ip=212.227.15.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1762339562; x=1762944362; i=markus.elfring@web.de;
	bh=KM0SK+z9pPR60LL6PZEVNU3j/vWMZTs4GdNGNT+Y7Kg=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=SyAF3mbxLoP81pEmN3NtfV4URrX5BMD2BVIlytljsO3SgzLzc7PxbNUBYHspOJKA
	 M27+C3B9/6e6ZWE8O4pYWbFviGF29Q9FJ8PgrtkzLQGS0rPJEfGFPnKGuZRZljqEB
	 K/0AzRzVHWGoByJ5hUW0SYg7Ng9wVWkU1G84dAE6rN/NnFd6+pWjUm3zgc6PRwPZw
	 7o4Dk5yPwXBagatAlF4cMgBVe/Zwllen27w12VOFTrjycuLogx7ofDgayrmHVG9Ef
	 HT7gWaEkg6Wb4d9H5qmbGu22sNrmJt0yCH8zASSHTtscNtV4VhpMALZZigntgXOPb
	 cQSqf6unJgTCSXiwMQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.92.250]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MG9DE-1vSfqA1iu4-0032aX; Wed, 05
 Nov 2025 11:46:02 +0100
Message-ID: <2e52f324-feee-4b94-a764-9f9095f4fce2@web.de>
Date: Wed, 5 Nov 2025 11:45:59 +0100
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: vulab@iscas.ac.cn, linux-watchdog@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>, =?UTF-8?B?R8O8bnRlciBSw7Zjaw==?=
 <linux@roeck-us.net>, Wim Van Sebroeck <wim@linux-watchdog.org>,
 Xingyu Wu <xingyu.wu@starfivetech.com>, Ziv Xu <ziv.xu@starfivetech.com>
References: <20251105084220.1334-1-vulab@iscas.ac.cn>
Subject: Re: [PATCH] watchdog: starfive: Fix resource leak in probe error path
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20251105084220.1334-1-vulab@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:M0saBlRz5G7/uD1PED1AZzIjD8xN9lBUtU40ouAkThkTWiB1cB/
 +ZTj1R55OyhOAZn/E6AFZ/QNasqFV6jAYRz40xw7btiVXGN9HcNWWUnaMOG91t/x+dnVm2Z
 mIWOE89YIJ71YZaBAvKBoNs+Edyla5uTI67psizoX88yTomcfMypTY904fZEsLxvWXwhjfx
 I3Lzi9SFV9cIJhgcRRLBg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:pKvkSbZV5lQ=;TVXGyyLpznka8n5Sf/G4ilOXBjZ
 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

> If pm_runtime_put_sync() fails after watchdog_register_device()
> succeeds, the probe function jumps to err_exit without
=E2=80=A6

Would an other word wrapping be a bit nicer for such a change description?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.18-rc4#n658

Regards,
Markus

