Return-Path: <linux-watchdog+bounces-2663-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DCDDA03B58
	for <lists+linux-watchdog@lfdr.de>; Tue,  7 Jan 2025 10:43:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DACCF3A53CF
	for <lists+linux-watchdog@lfdr.de>; Tue,  7 Jan 2025 09:42:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FD8B1E9B10;
	Tue,  7 Jan 2025 09:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=coasia.com header.i=@coasia.com header.b="d/zXjp8I"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from spam.coasia.com (mail2.coasia.com [112.168.119.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D08DD1E5721
	for <linux-watchdog@vger.kernel.org>; Tue,  7 Jan 2025 09:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=112.168.119.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736242901; cv=none; b=lj4WPwshQJrkWZTKJ+JWPmQi1i0RIbuhQV4JCGs5jXTnlIvfV/GT33gJHIc3FaYJUwlgLfW3dPZki3SAOgbcUKP2D94tqPnb9quU4FdI9jnaMDuut9yYYhtgnMI0/eP0jLNqwwp8AVldgTUpctI3NdJMA1cWFE4zBVvLtPWclmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736242901; c=relaxed/simple;
	bh=eQ63HQerGd0tL354CnLqNEBUmTYHwSIuzbNULeImO4I=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=NUBhWjMi7CKRkLyhmqBguvMOsjkus3irFn0zevcRP0E2AClNG4f5smQzfPwU6QFczM1lPFlHPK0LUoQTyt2uz9hmKI5H7+r/i/tP059rosLOk2h0IY+7y7mEmpT70ActEmFkvnr+/dO5PVctQeSTf/fVd34yyrf33lnEF56QTGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=coasia.com; spf=pass smtp.mailfrom=coasia.com; dkim=pass (1024-bit key) header.d=coasia.com header.i=@coasia.com header.b=d/zXjp8I; arc=none smtp.client-ip=112.168.119.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=coasia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=coasia.com
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=coasia.com; s=coasia;
	t=1736242896; bh=eQ63HQerGd0tL354CnLqNEBUmTYHwSIuzbNULeImO4I=; l=18;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version;
	b=d/zXjp8IV3SssQy0dQRGhQSn6flcpD+gCDTun9TlFTyU9LmqluYkv4GTMa6/mc4s/
	 +38Yel/j3J8VFMq7VBzyGQIX0LPXOb8d7eAnvGqwib7vSzvB2Xvbvxb4EtOYUDMYoa
	 jPSdroh7wigO0MDw1HgwJ5EO4xDP1OjOwN9dgAFw=
Received: from unknown (HELO GW-EX2.COASIA.COM) (192.168.10.14)
	by 192.168.10.159 with ESMTP; 7 Jan 2025 18:41:36 +0900
X-Original-SENDERIP: 192.168.10.14
X-Original-SENDERCOUNTRY: unknown
X-Original-MAILFROM: smn1196@coasia.com
X-Original-RCPTTO: linux-watchdog@vger.kernel.org
Received: from GW-EX2.COASIA.COM (192.168.10.14) by GW-EX2.COASIA.COM
 (192.168.10.14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.27; Tue, 7 Jan
 2025 18:41:37 +0900
Received: from GW-EX2.COASIA.COM ([fe80::ece6:664:5d82:a6a9]) by
 GW-EX2.COASIA.COM ([fe80::ece6:664:5d82:a6a9%5]) with mapi id 15.01.2308.027;
 Tue, 7 Jan 2025 18:41:36 +0900
From: smn1196 <smn1196@coasia.com>
To: "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>
Subject:
Thread-Index: AQHbYOhYRSTZxifX50aKNDzDenB5eA==
Date: Tue, 7 Jan 2025 09:41:36 +0000
Message-ID: <7372fa83-7e7b-4b25-b7ca-24ead08ea2b5@coasia.com>
Accept-Language: ko-KR, en-US
Content-Language: ko-KR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="utf-8"
Content-ID: <BD01D65E3E5F484BAAC1814643128625@COASIA.COM>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

c3Vic2NyaWJlDQo=

