Return-Path: <linux-watchdog+bounces-2609-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D6EC9FAE33
	for <lists+linux-watchdog@lfdr.de>; Mon, 23 Dec 2024 13:16:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 87E6E164FAC
	for <lists+linux-watchdog@lfdr.de>; Mon, 23 Dec 2024 12:16:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A353519992D;
	Mon, 23 Dec 2024 12:16:25 +0000 (UTC)
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp02.aussiebb.com.au (smtp02.aussiebb.com.au [121.200.0.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD812194C8B
	for <linux-watchdog@vger.kernel.org>; Mon, 23 Dec 2024 12:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=121.200.0.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734956185; cv=none; b=gEXrb/Rc1fKGrpFgB337hDiGJUTr1xwJPVxrbUI6wNVjWQAecGbMQKIVjrj+7vCspGDxyQuUvUbNpvoOj6ZNTDalFsIAYz2FMwj6Vc4ZsZl4LKgC4A7H7DAcoGBnFdl2BlV6fYF3j22dIZw+Bl52xf95lkw+b0J2d8msc8whqGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734956185; c=relaxed/simple;
	bh=eDxkL8/XIhSmBEgaT1zy7zIVeYT5UTja8kUAQFkCTho=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=HX8hKH5/fY4xNLnlscHJTU4gPdWgPbNhCbjzPdwQIW8/jy+JVsVik8YkwcsrHDh6nQ0UMB2biLXh2XVBftLpf3JQCYh8Vzu1HjIgUG9DWC8BVW1l2y6UkOqE/NjaZX/laVIJky44eeA2qWhSK+KVtwQv6Y9OE+sBY8aLTK/q42Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=foreveryoung.id.au; spf=pass smtp.mailfrom=foreveryoung.id.au; arc=none smtp.client-ip=121.200.0.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=foreveryoung.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foreveryoung.id.au
Received: from localhost (localhost.localdomain [127.0.0.1])
	by smtp02.aussiebb.com.au (Postfix) with ESMTP id 761D8100E1D
	for <linux-watchdog@vger.kernel.org>; Mon, 23 Dec 2024 23:16:20 +1100 (AEDT)
X-Virus-Scanned: Debian amavisd-new at smtp02.aussiebb.com.au
Received: from smtp02.aussiebb.com.au ([127.0.0.1])
	by localhost (smtp02.aussiebb.com.au [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8ScN7zvO7Yua for <linux-watchdog@vger.kernel.org>;
	Mon, 23 Dec 2024 23:16:20 +1100 (AEDT)
Received: by smtp02.aussiebb.com.au (Postfix, from userid 116)
	id 614A3100EC7; Mon, 23 Dec 2024 23:16:20 +1100 (AEDT)
X-Spam-Level: *
Received: from mail.foreveryoung.id.au (119-18-14-36.77120e.mel.nbn.aussiebb.net [119.18.14.36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp02.aussiebb.com.au (Postfix) with ESMTPS id 36A76100E1D
	for <linux-watchdog@vger.kernel.org>; Mon, 23 Dec 2024 23:16:20 +1100 (AEDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.foreveryoung.id.au (Postfix) with ESMTP id 5C58115EB0B
	for <linux-watchdog@vger.kernel.org>; Mon, 23 Dec 2024 23:15:10 +1100 (AEDT)
Received: from mail.foreveryoung.id.au ([127.0.0.1])
	by localhost (mail.foreveryoung.id.au [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id tVTTyfbj_tFc for <linux-watchdog@vger.kernel.org>;
	Mon, 23 Dec 2024 23:15:10 +1100 (AEDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.foreveryoung.id.au (Postfix) with ESMTP id 31372170DB2
	for <linux-watchdog@vger.kernel.org>; Mon, 23 Dec 2024 23:15:10 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at mail.foreveryoung.id.au
Received: from mail.foreveryoung.id.au ([127.0.0.1])
	by localhost (mail.foreveryoung.id.au [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id YYdsyBMA0dUR for <linux-watchdog@vger.kernel.org>;
	Mon, 23 Dec 2024 23:15:10 +1100 (AEDT)
Received: from SEYPR04MB6821.apcprd04.prod.outlook.com (unknown [40.99.49.221])
	by mail.foreveryoung.id.au (Postfix) with ESMTPSA id C40D115EB0B
	for <linux-watchdog@vger.kernel.org>; Mon, 23 Dec 2024 23:15:09 +1100 (AEDT)
From: "james@foreveryoung.id.au" <james@foreveryoung.id.au>
To: "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>
Subject: Re:  [PATCH v2] watchdog: it87_wdt: add support for IT8733
Thread-Topic:  [PATCH v2] watchdog: it87_wdt: add support for IT8733
Thread-Index: AQHbVTR3jiCFSQQHWEyLkryDniTIfw==
X-MS-Exchange-MessageSentRepresentingType: 1
Date: Mon, 23 Dec 2024 12:16:16 +0000
Message-ID:
	<SEYPR04MB6821BD74A23F3C6A561E78B8F3022@SEYPR04MB6821.apcprd04.prod.outlook.com>
References:
	<SEYPR04MB682104A5CC12856953A3A11CF3022@SEYPR04MB6821.apcprd04.prod.outlook.com>
In-Reply-To:
	<SEYPR04MB682104A5CC12856953A3A11CF3022@SEYPR04MB6821.apcprd04.prod.outlook.com>
Accept-Language: en-AU, en-US
Content-Language: en-AU
X-MS-Has-Attach: yes
X-MS-Exchange-Organization-SCL: -1
X-MS-TNEF-Correlator:
X-MS-Exchange-Organization-RecordReviewCfmType: 0
msip_labels:
Content-Type: multipart/mixed;
	boundary="_004_SEYPR04MB6821BD74A23F3C6A561E78B8F3022SEYPR04MB6821apcp_"
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

--_004_SEYPR04MB6821BD74A23F3C6A561E78B8F3022SEYPR04MB6821apcp_
Content-Type: multipart/alternative;
	boundary="_000_SEYPR04MB6821BD74A23F3C6A561E78B8F3022SEYPR04MB6821apcp_"

--_000_SEYPR04MB6821BD74A23F3C6A561E78B8F3022SEYPR04MB6821apcp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

I previously posted a patch titled "watchdog: it87_wdt: add support for IT8=
733" on 2024-12-23, but I realized there was an issue with the original ver=
sion. Specifically, I made a typo in the chip ID definition. I have fixed t=
he problem and am resubmitting the updated patch as v2.


Signed-off-by: James Young <james@foreveryoung.id.au>

________________________________
From: james@foreveryoung.id.au <james@foreveryoung.id.au>
Sent: Monday, 23 December 2024 11:06 PM
To: linux-watchdog@vger.kernel.org <linux-watchdog@vger.kernel.org>
Subject: [PATCH] watchdog: it87_wdt: add support for IT8733

Add support for the IT8733 Super I/O watchdog timer.

Tested on a Lenovo ThinkCenter M93p SFF.

Signed-off-by: James Young <james@foreveryoung.id.au>

--_000_SEYPR04MB6821BD74A23F3C6A561E78B8F3022SEYPR04MB6821apcp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
I previously posted a patch titled &quot;watchdog: it87_wdt: add support fo=
r IT8733&quot; on 2024-12-23, but I realized there was an issue with the or=
iginal version. Specifically, I made a typo in the chip ID definition. I ha=
ve fixed the problem and am resubmitting the
 updated patch as v2.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<pre><div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontServ=
ice, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);"=
>Signed-off-by: James Young &lt;james@foreveryoung.id.au&gt;</div></pre>
<hr style=3D"display: inline-block; width: 98%;">
<div id=3D"divRplyFwdMsg" dir=3D"ltr" style=3D"color: inherit;"><span style=
=3D"font-family: Calibri, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);=
"><b>From:</b>&nbsp;james@foreveryoung.id.au &lt;james@foreveryoung.id.au&g=
t;<br>
<b>Sent:</b>&nbsp;Monday, 23 December 2024 11:06 PM<br>
<b>To:</b>&nbsp;linux-watchdog@vger.kernel.org &lt;linux-watchdog@vger.kern=
el.org&gt;<br>
<b>Subject:</b>&nbsp;[PATCH] watchdog: it87_wdt: add support for IT8733</sp=
an>
<div>&nbsp;</div>
</div>
<div class=3D"elementToProof" style=3D"direction: ltr; font-family: Aptos, =
Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; fo=
nt-size: 12pt; color: rgb(0, 0, 0);">
Add support for the IT8733 Super I/O watchdog timer.</div>
<div style=3D"direction: ltr; font-family: Aptos, Aptos_EmbeddedFont, Aptos=
_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb=
(0, 0, 0);">
<br>
</div>
<div style=3D"direction: ltr; font-family: Aptos, Aptos_EmbeddedFont, Aptos=
_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb=
(0, 0, 0);">
Tested on a Lenovo ThinkCenter M93p SFF.</div>
<div style=3D"direction: ltr; font-family: Aptos, Aptos_EmbeddedFont, Aptos=
_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb=
(0, 0, 0);">
<br>
</div>
<div style=3D"direction: ltr; font-family: Aptos, Aptos_EmbeddedFont, Aptos=
_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb=
(0, 0, 0);">
Signed-off-by: James Young &lt;james@foreveryoung.id.au&gt;</div>
</body>
</html>

--_000_SEYPR04MB6821BD74A23F3C6A561E78B8F3022SEYPR04MB6821apcp_--

--_004_SEYPR04MB6821BD74A23F3C6A561E78B8F3022SEYPR04MB6821apcp_
Content-Type: application/octet-stream;
	name="0002-watchdog-it87_wdt-add-support-for-IT8733.patch"
Content-Description: 0002-watchdog-it87_wdt-add-support-for-IT8733.patch
Content-Disposition: attachment;
	filename="0002-watchdog-it87_wdt-add-support-for-IT8733.patch"; size=1086;
	creation-date="Mon, 23 Dec 2024 12:12:39 GMT";
	modification-date="Mon, 23 Dec 2024 12:14:24 GMT"
Content-Transfer-Encoding: base64

RnJvbSAyZjU3YjZkZmY1NzRjNDE3ZjkzZGVhYTk3ZDhlNWQzMWFiYTIwMmRiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBKYW1lcyBZb3VuZyA8amFtZXNAZm9yZXZlcnlvdW5nLmlkLmF1
PgpEYXRlOiBNb24sIDIzIERlYyAyMDI0IDIzOjEwOjIzICsxMTAwClN1YmplY3Q6IFtQQVRDSF0g
d2F0Y2hkb2c6IGl0ODdfd2R0OiBhZGQgc3VwcG9ydCBmb3IgSVQ4NzMzCgotLS0KIGRyaXZlcnMv
d2F0Y2hkb2cvaXQ4N193ZHQuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvd2F0Y2hkb2cvaXQ4N193ZHQu
YyBiL2RyaXZlcnMvd2F0Y2hkb2cvaXQ4N193ZHQuYwppbmRleCAzNmM4YmRjYTQ3NDMuLjkzYWJh
ZWIxZTg0YiAxMDA2NDQKLS0tIGEvZHJpdmVycy93YXRjaGRvZy9pdDg3X3dkdC5jCisrKyBiL2Ry
aXZlcnMvd2F0Y2hkb2cvaXQ4N193ZHQuYwpAQCAtNzEsNyArNzEsNyBAQAogI2RlZmluZSBJVDg3
MjFfSUQgMHg4NzIxCiAjZGVmaW5lIElUODcyNl9JRCAweDg3MjYgLyogdGhlIGRhdGEgc2hlZXQg
c3VnZ2VzdCB3cm9uZ2x5IDB4ODcxNiAqLwogI2RlZmluZSBJVDg3MjhfSUQgMHg4NzI4Ci0jZGVm
aW5lIElUODcyOF9JRCAweDg3MzMKKyNkZWZpbmUgSVQ4NzMzX0lEIDB4ODczMwogI2RlZmluZSBJ
VDg3NzJfSUQgMHg4NzcyCiAjZGVmaW5lIElUODc4M19JRCAweDg3ODMKICNkZWZpbmUgSVQ4Nzg0
X0lEIDB4ODc4NAotLSAKMi40My4wCgo=

--_004_SEYPR04MB6821BD74A23F3C6A561E78B8F3022SEYPR04MB6821apcp_--

