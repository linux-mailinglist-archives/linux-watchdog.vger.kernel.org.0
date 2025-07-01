Return-Path: <linux-watchdog+bounces-3794-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C0F75AF031B
	for <lists+linux-watchdog@lfdr.de>; Tue,  1 Jul 2025 20:46:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C87401C021C2
	for <lists+linux-watchdog@lfdr.de>; Tue,  1 Jul 2025 18:46:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86C2D148832;
	Tue,  1 Jul 2025 18:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="D1Uf3taY";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ZIvdQSLt"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from fout-b1-smtp.messagingengine.com (fout-b1-smtp.messagingengine.com [202.12.124.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1716A3596B;
	Tue,  1 Jul 2025 18:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751395566; cv=none; b=fWSnN560gxdKoPf7ZCSI1sPsHwrZX/4TfskjsRPm22jxnv0aOIfUPGAi+jBZSl+WJiAuoykfzXb1D5OqUTIMPuXcdWjMEglM/OvnmKKtDZy2W7n0+UgTVtc0tq4SZC7LmZwSPSA92kQpiDnjvf0RH4X5XNGI3YIZFw0ymnADPZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751395566; c=relaxed/simple;
	bh=Up8UX9H+7ZUNNfLzmgCkSVCiNokRtIVixpAx52BVJbs=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=Cl6jYQWHzYlONmmZ9eWxWjtPycYTb2RSJ+4Pk9k8KC3TFX0pRZdqOQQUTkIHEDTt2EwYvGPiVPNTO/A4Uy3rCbAdmMkWapfEQJUDbYJGaJaw+a9z7jKXPWDtK/GriZpS2WqOf4wjBDnhy7UG031F+RzlVQ9tvWC8/anilPZMeW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=D1Uf3taY; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ZIvdQSLt; arc=none smtp.client-ip=202.12.124.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id 9F1A71D00173;
	Tue,  1 Jul 2025 14:46:00 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Tue, 01 Jul 2025 14:46:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1751395560;
	 x=1751481960; bh=Xr0RFbgZjw3WqPK6EkRfzHhNY8eU/QZTAElNC/U09to=; b=
	D1Uf3taYrE5w0UnL6DcoEa7HwVFgpUTDGrzCxPGFaKNHtdGYR1F97wy93u8XIoPt
	mNJBW4+/DtKHzbMSjEdi0OfGxtfM6RiEjKHPSSzKJ05w68+o5VR6y7twzdTja+3E
	t5Peml3llHhbh7YF0hIF5wHxz/rodSLiFBspyf8sZSaA9A0VZQdXcslALDiF3q34
	04gLPJ+vvqcTRgzj8XM8QtpjoQSSMuCmlTjx6CC7J4lkfUe0FRSlJtk3YIXQsW42
	Kqsit5SxnPbInu8xfuRdLa7Yko8r+eNBK0vGWG/9zCSeto33mhepVMvE5yMtBrXi
	1Tp5D8Cnbw0H2eQG9XbAXA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1751395560; x=
	1751481960; bh=Xr0RFbgZjw3WqPK6EkRfzHhNY8eU/QZTAElNC/U09to=; b=Z
	IvdQSLt59/Zx0zQNJkNAsZdPsDu+v7Q73LSOfim4Gwgb5tXctxUl5gKidJ7FR1mZ
	kvrX6bhd2yJyXNOd009Oo4ZnHNOwGZd6acX0u+bkY5PJuVPEnsbXPuw+fWms+OSy
	0A7kRNSKylEnDErVfCPUo/AJD3yL0IKpWGe9yoGl7ZVq1n/J9DZV4AOSS8Jebarm
	iLBUWHRxds2ryRm6mwu0ZCL4da0j51OfWCcrEFGsvdR76tSNZLKwoIupfLN2IfJJ
	4in6JoBQ+6arKYMRdOVQgobACfxrhXnWlAj8xNCyjWtIzR0Dpzco2vFjZ+D+NMQl
	JbmV/487+Yc+9eNx+2aog==
X-ME-Sender: <xms:5ixkaGYpeVbjrrhnc5zoVB_3wLv0mONBIlHrLqP41QNaWfz0MK2OLQ>
    <xme:5ixkaJZgxpK8fWWl29KH40EOX-MmDFZNTKGgViPP2nb0xkDmsE3fHWJyF-Q6o8NOb
    NSpeAed5qNkH7rOvLk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduhedvjecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpefhtdfhvddtfeehudekteeggffghfejgeegteefgffgvedugeduveelvdekhfdvieen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnug
    esrghrnhgusgdruggvpdhnsggprhgtphhtthhopedujedpmhhouggvpehsmhhtphhouhht
    pdhrtghpthhtoheprhdrmhgrrhgvkhesrghsshgvmhgslhgvrhdrtgiipdhrtghpthhtoh
    epuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvthdprhgtphhtthhopegrnhgurhgvrghs
    sehgrghishhlvghrrdgtohhmpdhrtghpthhtohepuggvlhhlvghrsehgmhigrdguvgdprh
    gtphhtthhopehjrghmvghsrdgsohhtthhomhhlvgihsehhrghnshgvnhhprghrthhnvghr
    shhhihhprdgtohhmpdhrtghpthhtohepiihijhhunhgphhhusehitghlohhuugdrtghomh
    dprhgtphhtthhopegtrghstggrrhguohesihhgrghlihgrrdgtohhmpdhrtghpthhtohep
    fihimheslhhinhhugidqfigrthgthhguohhgrdhorhhgpdhrtghpthhtohepghhrvghgkh
    hhsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhg
X-ME-Proxy: <xmx:5ixkaA885s52W79Hch3_FsaKKkYuCwCxYa_PtrpS2dVsBDEnyOacbQ>
    <xmx:5ixkaIp4tJa7_5udgLIsoEQ4PLK88TLX9JHpYicsWCb4wecrTXK5xg>
    <xmx:5ixkaBoTn1Yr9PN6E_LE1tPeZBSEi8D__0SE6eDlzFPQpRZlIcWiqg>
    <xmx:5ixkaGQaw3X9gLjRwo-XuNrzgtkZ_m8wdzoKYSH_6ISHbW0MT1OvNQ>
    <xmx:6CxkaG8Fpv1MWbPVQ-pQazPgaQc4udQhnrHm3ZhUP5_gXySaAPmXccaD>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 27BD8700065; Tue,  1 Jul 2025 14:45:58 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: T7fb883a34eda41ad
Date: Tue, 01 Jul 2025 20:45:27 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Zijun Hu" <zijun_hu@icloud.com>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Jean Delvare" <jdelvare@suse.com>, "Guenter Roeck" <linux@roeck-us.net>,
 "Rudolf Marek" <r.marek@assembler.cz>,
 "Wim Van Sebroeck" <wim@linux-watchdog.org>,
 "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
 "Helge Deller" <deller@gmx.de>, "David S . Miller" <davem@davemloft.net>,
 "Andreas Larsson" <andreas@gaisler.com>
Cc: "Thadeu Lima de Souza Cascardo" <cascardo@igalia.com>,
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-watchdog@vger.kernel.org, linux-parisc@vger.kernel.org,
 sparclinux@vger.kernel.org, "Zijun Hu" <zijun.hu@oss.qualcomm.com>
Message-Id: <ad90af20-33f4-40e3-b08a-ce34437174db@app.fastmail.com>
In-Reply-To: <20250701-rfc_miscdev-v2-7-3eb22bf533be@oss.qualcomm.com>
References: <20250701-rfc_miscdev-v2-0-3eb22bf533be@oss.qualcomm.com>
 <20250701-rfc_miscdev-v2-7-3eb22bf533be@oss.qualcomm.com>
Subject: Re: [PATCH v2 7/9] char: misc: Allocate 4 more fixed minors for watchdog
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, Jul 1, 2025, at 17:24, Zijun Hu wrote:
> From: Zijun Hu <zijun.hu@oss.qualcomm.com>
>
> There are drivers which needs more fixed minors for watchdog, but
> watchdog only has one fixed minor currently, it causes hardcoded and
> unregistered fixed minors are used by these drivers.
>
> Allocate 4 more fixed minors and apply for these drivers.

Missing signoff?


I don't think this is the right fix here, these drivers implement
the normal watchdog API, so they should not even call misc_register
but should instead call watchdog_dev_register().

Obviously doing this right is a bigger change, so maybe the simpler
answer is to use dynamic minors instead of the nonstandard ones.

FWIW, I double-checked to see whether there are any in-tree
references to these two drivers, and there is one each:

drivers/i2c/busses/i2c-i801.c:	{ "Hermes", DMI_DEV_TYPE_OTHER, 0x73, "fscher" },
drivers/i2c/busses/i2c-i801.c:	{ "Hades",  DMI_DEV_TYPE_OTHER, 0x73, "fschds" },
drivers/i2c/busses/i2c-i801.c:	{ "Syleus", DMI_DEV_TYPE_OTHER, 0x73, "fscsyl" },
arch/powerpc/boot/dts/fsl/t4240rdb.dts:                         compatible = "winbond,w83793";

These were added in 2009 and 2016, respectively, so the hardware
is probably around somewhere but quite hard to find.

    Arnd

