Return-Path: <linux-watchdog+bounces-4600-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EFA6C61C35
	for <lists+linux-watchdog@lfdr.de>; Sun, 16 Nov 2025 21:21:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id B158D35D622
	for <lists+linux-watchdog@lfdr.de>; Sun, 16 Nov 2025 20:21:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADDF221FF3B;
	Sun, 16 Nov 2025 20:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="bQJEM4Yx"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B820F23E23C;
	Sun, 16 Nov 2025 20:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763324500; cv=none; b=MAZHXV13SFnmC3nWVyCsc361Kkj90UtJzp6Zi5h5hu3u2P1+IDkuaRgJlRSnwRCIPMP0Q01aeRyxVO0SyBCtqrDPXIk3Eee52KgsXVzJmIBXn7w81ZQHyZS4oYwWoYkVHynN4VARzNNwYk4nDMMH9rP3vnKQcwK3X0IIv/M5kA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763324500; c=relaxed/simple;
	bh=pHEKON0IJEvSHLsiLD7bFuCEOLbveWl63Y23VpcmUcw=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=ewdmmEMJWmDbt5XeJNfQEmXDqtRWcpLBVS4F9p2YQAYUoJ3bTpBvs7p2cxX6BzZMdNqLxaut4VjCKH3eKVdqReXmxA6CN82w542IckMQrzDXEKdxT4/EjgpKbfxuNIWGjRKIk1uoFhcUSEDsG7qfmWEX3oQ9Zr5x8hWOuJWqZJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=bQJEM4Yx; arc=none smtp.client-ip=212.227.15.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1763324484; x=1763929284; i=markus.elfring@web.de;
	bh=pHEKON0IJEvSHLsiLD7bFuCEOLbveWl63Y23VpcmUcw=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=bQJEM4Yxv/2vhyYGPSiN1ub4+y9zUaAHi9i5xWKO+srOfrlaxFp+hkqo2QdzOUG/
	 lEJKZ0bG744r+heUstliTZubTY/Yq87hUwazi2mrWWHd71o1uS9cCaAnFpmxhNgFb
	 JWMnBM5EEfk1JEhAFDGNocFDh/rXzii8zXopzBvsokQQuY7FpxiOOp8LNwMmcoWb3
	 +NIJVgpfrc0xgoFhN7F60HWcLrZ/d1MZ7wWf9IkcRZIiZ3Zu5uIoFr9p6RXF5MYNr
	 4gI/cGD2c34N61rRazJEdkvIzk+1dF7xi5mdZ/+z3FOWILUsbPQVIvr7nP/twMlaY
	 XunktVmfJH5lanMvHg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.193]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MCXVX-1vTDZn1TNb-008TS5; Sun, 16
 Nov 2025 21:21:24 +0100
Message-ID: <804a53d6-db99-430d-89d9-42ebdfda8eed@web.de>
Date: Sun, 16 Nov 2025 21:21:20 +0100
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: vulab@iscas.ac.cn, linux-watchdog@vger.kernel.org,
 =?UTF-8?B?R8O8bnRlciBSw7Zjaw==?= <linux@roeck-us.net>,
 Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: LKML <linux-kernel@vger.kernel.org>
References: <20251113023032.547-1-vulab@iscas.ac.cn>
Subject: Re: [PATCH v2] watchdog: wdat_wdt: Fix ACPI table leak in probe
 function
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20251113023032.547-1-vulab@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:0FmvoSOClZK1vgqrLzVBRC/H/zbU+w8nPANVH2gBVmBWfTi9/NV
 dfHbl+g+702LWRMyQ8ceWqK3kH1Q0ttGJdqUtvrjc5xSdWUfowQYPDRgcPuCEOS8Dy194zM
 by+uRtUBebjgvtipF4S8luVjFqmtppYRfVKFsCEufpVSnFGG7sdY8xj2VxBb8Gfw2BWWOEb
 g7eXjfSPrfGteq4h9sJ+A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:yFpZHQRI+4k=;C+VO4t4CWsSBp9JS2qYIkYGpDAL
 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
 gn3n5Wp3QzBo5Kz/4=

> Add a single cleanup path which calls acpi_put_table() to ensure
> the ACPI table is always released.

Would additional labels become helpful also for error code assignments?

Regards,
Markus

