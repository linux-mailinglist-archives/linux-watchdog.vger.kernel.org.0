Return-Path: <linux-watchdog+bounces-2608-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D9F9FAE1C
	for <lists+linux-watchdog@lfdr.de>; Mon, 23 Dec 2024 13:06:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E58AA7A1968
	for <lists+linux-watchdog@lfdr.de>; Mon, 23 Dec 2024 12:06:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59DED166307;
	Mon, 23 Dec 2024 12:06:34 +0000 (UTC)
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp02.aussiebb.com.au (smtp02.aussiebb.com.au [121.200.0.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3800F1A8F62
	for <linux-watchdog@vger.kernel.org>; Mon, 23 Dec 2024 12:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=121.200.0.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734955594; cv=none; b=k8B/L7nZ5b9QbcdOlKNQ+NEaWuI9WITrGinZWtR0V1RPKZ2SIQLMB51uP6ySTw8Ur1X3PiBbHnWdi6sdV6tW5OKJxW85y73JDiZQS3yFuGkfzRUtqln2hXcHbxCo5VZK/bnGW3Fox8ABptYIvJKxmSqYI/k3gX6w8Jl5pwXZFfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734955594; c=relaxed/simple;
	bh=4UbpksMjZj7LBxrG5CE8kQV+TJwguwW+1Gfnos/twlE=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=fXzt35VXSfbxn4lC/lYdEl1HozXHIXfAFXe/wS0JwHHvNPltbesA9/xJk6Ks1wAjAIk0PBGvZDhxmESFvg6O9AEfS1MMt0J4ZnTZMFGlezB1KPJs8zZCP2LLKD9YXHkscKznGORnuNrs6VBYjE37ipGWfKmCSD966EyfKUIjLlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=foreveryoung.id.au; spf=pass smtp.mailfrom=foreveryoung.id.au; arc=none smtp.client-ip=121.200.0.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=foreveryoung.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foreveryoung.id.au
Received: from localhost (localhost.localdomain [127.0.0.1])
	by smtp02.aussiebb.com.au (Postfix) with ESMTP id E7246100DBC
	for <linux-watchdog@vger.kernel.org>; Mon, 23 Dec 2024 23:06:29 +1100 (AEDT)
X-Virus-Scanned: Debian amavisd-new at smtp02.aussiebb.com.au
Received: from smtp02.aussiebb.com.au ([127.0.0.1])
	by localhost (smtp02.aussiebb.com.au [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3nELopgnPFAK for <linux-watchdog@vger.kernel.org>;
	Mon, 23 Dec 2024 23:06:29 +1100 (AEDT)
Received: by smtp02.aussiebb.com.au (Postfix, from userid 116)
	id C89F2100B9F; Mon, 23 Dec 2024 23:06:29 +1100 (AEDT)
X-Spam-Level: *
Received: from mail.foreveryoung.id.au (119-18-14-36.77120e.mel.nbn.aussiebb.net [119.18.14.36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp02.aussiebb.com.au (Postfix) with ESMTPS id 6125310089A
	for <linux-watchdog@vger.kernel.org>; Mon, 23 Dec 2024 23:06:29 +1100 (AEDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.foreveryoung.id.au (Postfix) with ESMTP id 677ED15EB0B
	for <linux-watchdog@vger.kernel.org>; Mon, 23 Dec 2024 23:05:19 +1100 (AEDT)
Received: from mail.foreveryoung.id.au ([127.0.0.1])
	by localhost (mail.foreveryoung.id.au [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id jwOwh8wtYNvj for <linux-watchdog@vger.kernel.org>;
	Mon, 23 Dec 2024 23:05:19 +1100 (AEDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.foreveryoung.id.au (Postfix) with ESMTP id 2CAA6170DB2
	for <linux-watchdog@vger.kernel.org>; Mon, 23 Dec 2024 23:05:19 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at mail.foreveryoung.id.au
Received: from mail.foreveryoung.id.au ([127.0.0.1])
	by localhost (mail.foreveryoung.id.au [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id rlJ4quydI1io for <linux-watchdog@vger.kernel.org>;
	Mon, 23 Dec 2024 23:05:19 +1100 (AEDT)
Received: from SEYPR04MB6821.apcprd04.prod.outlook.com (unknown [40.99.49.221])
	by mail.foreveryoung.id.au (Postfix) with ESMTPSA id BEACD15EB0B
	for <linux-watchdog@vger.kernel.org>; Mon, 23 Dec 2024 23:05:18 +1100 (AEDT)
From: "james@foreveryoung.id.au" <james@foreveryoung.id.au>
To: "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>
Subject:  [PATCH] watchdog: it87_wdt: add support for IT8733
Thread-Topic:  [PATCH] watchdog: it87_wdt: add support for IT8733
Thread-Index: AQHbVTLxoH4qjwK4Akmi+yJVv7Tfvg==
X-MS-Exchange-MessageSentRepresentingType: 1
Date: Mon, 23 Dec 2024 12:06:25 +0000
Message-ID:
	<SEYPR04MB682104A5CC12856953A3A11CF3022@SEYPR04MB6821.apcprd04.prod.outlook.com>
Accept-Language: en-AU, en-US
Content-Language: en-AU
X-MS-Has-Attach: yes
X-MS-Exchange-Organization-SCL: -1
X-MS-TNEF-Correlator:
X-MS-Exchange-Organization-RecordReviewCfmType: 0
msip_labels:
Content-Type: multipart/mixed;
	boundary="_004_SEYPR04MB682104A5CC12856953A3A11CF3022SEYPR04MB6821apcp_"
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

--_004_SEYPR04MB682104A5CC12856953A3A11CF3022SEYPR04MB6821apcp_
Content-Type: multipart/alternative;
	boundary="_000_SEYPR04MB682104A5CC12856953A3A11CF3022SEYPR04MB6821apcp_"

--_000_SEYPR04MB682104A5CC12856953A3A11CF3022SEYPR04MB6821apcp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Add support for the IT8733 Super I/O watchdog timer.

Tested on a Lenovo ThinkCenter M93p SFF.

Signed-off-by: James Young <james@foreveryoung.id.au>

--_000_SEYPR04MB682104A5CC12856953A3A11CF3022SEYPR04MB6821apcp_
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
Add support for the IT8733 Super I/O watchdog timer.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Tested on a Lenovo ThinkCenter M93p SFF.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Signed-off-by: James Young &lt;james@foreveryoung.id.au&gt;</div>
</body>
</html>

--_000_SEYPR04MB682104A5CC12856953A3A11CF3022SEYPR04MB6821apcp_--

--_004_SEYPR04MB682104A5CC12856953A3A11CF3022SEYPR04MB6821apcp_
Content-Type: application/octet-stream;
	name="0001-watchdog-it87_wdt-add-support-for-IT8733.patch"
Content-Description: 0001-watchdog-it87_wdt-add-support-for-IT8733.patch
Content-Disposition: attachment;
	filename="0001-watchdog-it87_wdt-add-support-for-IT8733.patch"; size=5996;
	creation-date="Mon, 23 Dec 2024 12:05:26 GMT";
	modification-date="Mon, 23 Dec 2024 12:05:54 GMT"
Content-Transfer-Encoding: base64

RnJvbSAyMDQ3NjcxMjYzMDY3YTQxZDc2YjRlMDU4MmIzMGNmZGE4Yzg2Nzc5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBKYW1lcyBZb3VuZyA8amFtZXNAZm9yZXZlcnlvdW5nLmlkLmF1
PgpEYXRlOiBNb24sIDIzIERlYyAyMDI0IDIyOjQxOjU4ICsxMTAwClN1YmplY3Q6IFtQQVRDSF0g
d2F0Y2hkb2c6IGl0ODdfd2R0OiBhZGQgc3VwcG9ydCBmb3IgSVQ4NzMzCgotLS0KIGRyaXZlcnMv
d2F0Y2hkb2cvaXQ4N193ZHQuYyB8IDExOCArKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0t
LS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA2MiBpbnNlcnRpb25zKCspLCA1NiBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL3dhdGNoZG9nL2l0ODdfd2R0LmMgYi9kcml2ZXJzL3dhdGNo
ZG9nL2l0ODdfd2R0LmMKaW5kZXggYTFlMjNkY2U4ODEwLi4zNmM4YmRjYTQ3NDMgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvd2F0Y2hkb2cvaXQ4N193ZHQuYworKysgYi9kcml2ZXJzL3dhdGNoZG9nL2l0
ODdfd2R0LmMKQEAgLTE1LDcgKzE1LDcgQEAKICAqCVN1cHBvcnQgb2YgdGhlIHdhdGNoZG9nIHRp
bWVycywgd2hpY2ggYXJlIGF2YWlsYWJsZSBvbgogICoJSVQ4NjA3LCBJVDg2MTMsIElUODYyMCwg
SVQ4NjIyLCBJVDg2MjUsIElUODYyOCwgSVQ4NjU1LCBJVDg2NTksCiAgKglJVDg2NjUsIElUODY4
NiwgSVQ4NzAyLCBJVDg3MTIsIElUODcxNiwgSVQ4NzE4LCBJVDg3MjAsIElUODcyMSwKLSAqCUlU
ODcyNiwJSVQ4NzI4LCBJVDg3NzIsIElUODc4MywgSVQ4Nzg0IGFuZCBJVDg3ODYuCisgKglJVDg3
MjYsCUlUODcyOCwgSVQ4NzMzLCBJVDg3NzIsIElUODc4MywgSVQ4Nzg0IGFuZCBJVDg3ODYuCiAg
Ki8KIAogI2RlZmluZSBwcl9mbXQoZm10KSBLQlVJTERfTU9ETkFNRSAiOiAiIGZtdApAQCAtMzAs
NzAgKzMwLDcxIEBACiAjaW5jbHVkZSA8bGludXgvdHlwZXMuaD4KICNpbmNsdWRlIDxsaW51eC93
YXRjaGRvZy5oPgogCi0jZGVmaW5lIFdBVENIRE9HX05BTUUJCSJJVDg3IFdEVCIKKyNkZWZpbmUg
V0FUQ0hET0dfTkFNRSAiSVQ4NyBXRFQiCiAKIC8qIERlZmF1bHRzIGZvciBNb2R1bGUgUGFyYW1l
dGVyICovCi0jZGVmaW5lIERFRkFVTFRfVElNRU9VVAkJNjAKLSNkZWZpbmUgREVGQVVMVF9URVNU
TU9ERQkwCi0jZGVmaW5lIERFRkFVTFRfTk9XQVlPVVQJV0FUQ0hET0dfTk9XQVlPVVQKKyNkZWZp
bmUgREVGQVVMVF9USU1FT1VUIDYwCisjZGVmaW5lIERFRkFVTFRfVEVTVE1PREUgMAorI2RlZmlu
ZSBERUZBVUxUX05PV0FZT1VUIFdBVENIRE9HX05PV0FZT1VUCiAKIC8qIElPIFBvcnRzICovCi0j
ZGVmaW5lIFJFRwkJMHgyZQotI2RlZmluZSBWQUwJCTB4MmYKKyNkZWZpbmUgUkVHIDB4MmUKKyNk
ZWZpbmUgVkFMIDB4MmYKIAogLyogTG9naWNhbCBkZXZpY2UgTnVtYmVycyBMRE4gKi8KLSNkZWZp
bmUgRUMJCTB4MDQKLSNkZWZpbmUgR1BJTwkJMHgwNworI2RlZmluZSBFQyAweDA0CisjZGVmaW5l
IEdQSU8gMHgwNwogCiAvKiBDb25maWd1cmF0aW9uIFJlZ2lzdGVycyBhbmQgRnVuY3Rpb25zICov
Ci0jZGVmaW5lIExETlJFRwkJMHgwNwotI2RlZmluZSBDSElQSUQJCTB4MjAKLSNkZWZpbmUgQ0hJ
UFJFVgkJMHgyMgorI2RlZmluZSBMRE5SRUcgMHgwNworI2RlZmluZSBDSElQSUQgMHgyMAorI2Rl
ZmluZSBDSElQUkVWIDB4MjIKIAogLyogQ2hpcCBJZCBudW1iZXJzICovCi0jZGVmaW5lIE5PX0RF
Vl9JRAkweGZmZmYKLSNkZWZpbmUgSVQ4NjA3X0lECTB4ODYwNwotI2RlZmluZSBJVDg2MTNfSUQJ
MHg4NjEzCi0jZGVmaW5lIElUODYyMF9JRAkweDg2MjAKLSNkZWZpbmUgSVQ4NjIyX0lECTB4ODYy
MgotI2RlZmluZSBJVDg2MjVfSUQJMHg4NjI1Ci0jZGVmaW5lIElUODYyOF9JRAkweDg2MjgKLSNk
ZWZpbmUgSVQ4NjU1X0lECTB4ODY1NQotI2RlZmluZSBJVDg2NTlfSUQJMHg4NjU5Ci0jZGVmaW5l
IElUODY2NV9JRAkweDg2NjUKLSNkZWZpbmUgSVQ4Njg2X0lECTB4ODY4NgotI2RlZmluZSBJVDg3
MDJfSUQJMHg4NzAyCi0jZGVmaW5lIElUODcwNV9JRAkweDg3MDUKLSNkZWZpbmUgSVQ4NzEyX0lE
CTB4ODcxMgotI2RlZmluZSBJVDg3MTZfSUQJMHg4NzE2Ci0jZGVmaW5lIElUODcxOF9JRAkweDg3
MTgKLSNkZWZpbmUgSVQ4NzIwX0lECTB4ODcyMAotI2RlZmluZSBJVDg3MjFfSUQJMHg4NzIxCi0j
ZGVmaW5lIElUODcyNl9JRAkweDg3MjYJLyogdGhlIGRhdGEgc2hlZXQgc3VnZ2VzdCB3cm9uZ2x5
IDB4ODcxNiAqLwotI2RlZmluZSBJVDg3MjhfSUQJMHg4NzI4Ci0jZGVmaW5lIElUODc3Ml9JRAkw
eDg3NzIKLSNkZWZpbmUgSVQ4NzgzX0lECTB4ODc4MwotI2RlZmluZSBJVDg3ODRfSUQJMHg4Nzg0
Ci0jZGVmaW5lIElUODc4Nl9JRAkweDg3ODYKKyNkZWZpbmUgTk9fREVWX0lEIDB4ZmZmZgorI2Rl
ZmluZSBJVDg2MDdfSUQgMHg4NjA3CisjZGVmaW5lIElUODYxM19JRCAweDg2MTMKKyNkZWZpbmUg
SVQ4NjIwX0lEIDB4ODYyMAorI2RlZmluZSBJVDg2MjJfSUQgMHg4NjIyCisjZGVmaW5lIElUODYy
NV9JRCAweDg2MjUKKyNkZWZpbmUgSVQ4NjI4X0lEIDB4ODYyOAorI2RlZmluZSBJVDg2NTVfSUQg
MHg4NjU1CisjZGVmaW5lIElUODY1OV9JRCAweDg2NTkKKyNkZWZpbmUgSVQ4NjY1X0lEIDB4ODY2
NQorI2RlZmluZSBJVDg2ODZfSUQgMHg4Njg2CisjZGVmaW5lIElUODcwMl9JRCAweDg3MDIKKyNk
ZWZpbmUgSVQ4NzA1X0lEIDB4ODcwNQorI2RlZmluZSBJVDg3MTJfSUQgMHg4NzEyCisjZGVmaW5l
IElUODcxNl9JRCAweDg3MTYKKyNkZWZpbmUgSVQ4NzE4X0lEIDB4ODcxOAorI2RlZmluZSBJVDg3
MjBfSUQgMHg4NzIwCisjZGVmaW5lIElUODcyMV9JRCAweDg3MjEKKyNkZWZpbmUgSVQ4NzI2X0lE
IDB4ODcyNiAvKiB0aGUgZGF0YSBzaGVldCBzdWdnZXN0IHdyb25nbHkgMHg4NzE2ICovCisjZGVm
aW5lIElUODcyOF9JRCAweDg3MjgKKyNkZWZpbmUgSVQ4NzI4X0lEIDB4ODczMworI2RlZmluZSBJ
VDg3NzJfSUQgMHg4NzcyCisjZGVmaW5lIElUODc4M19JRCAweDg3ODMKKyNkZWZpbmUgSVQ4Nzg0
X0lEIDB4ODc4NAorI2RlZmluZSBJVDg3ODZfSUQgMHg4Nzg2CiAKIC8qIEVudmlyb25tZW50IENv
bnRyb2xsZXIgQ29uZmlndXJhdGlvbiBSZWdpc3RlcnMgTEROPTB4MDQgKi8KLSNkZWZpbmUgU0NS
MQkJMHhmYQorI2RlZmluZSBTQ1IxIDB4ZmEKIAogLyogRW52aXJvbm1lbnQgQ29udHJvbGxlciBC
aXRzIFNDUjEgKi8KLSNkZWZpbmUgV0RUX1BXUkdECTB4MjAKKyNkZWZpbmUgV0RUX1BXUkdEIDB4
MjAKIAogLyogR1BJTyBDb25maWd1cmF0aW9uIFJlZ2lzdGVycyBMRE49MHgwNyAqLwotI2RlZmlu
ZSBXRFRDVFJMCQkweDcxCi0jZGVmaW5lIFdEVENGRwkJMHg3MgotI2RlZmluZSBXRFRWQUxMU0IJ
MHg3MwotI2RlZmluZSBXRFRWQUxNU0IJMHg3NAorI2RlZmluZSBXRFRDVFJMIDB4NzEKKyNkZWZp
bmUgV0RUQ0ZHIDB4NzIKKyNkZWZpbmUgV0RUVkFMTFNCIDB4NzMKKyNkZWZpbmUgV0RUVkFMTVNC
IDB4NzQKIAogLyogR1BJTyBCaXRzIFdEVENGRyAqLwotI2RlZmluZSBXRFRfVE9WMQkweDgwCi0j
ZGVmaW5lIFdEVF9LUlNUCTB4NDAKLSNkZWZpbmUgV0RUX1RPVkUJMHgyMAotI2RlZmluZSBXRFRf
UFdST0sJMHgxMCAvKiBub3QgaW4gaXQ4NzIxICovCi0jZGVmaW5lIFdEVF9JTlRfTUFTSwkweDBm
CisjZGVmaW5lIFdEVF9UT1YxIDB4ODAKKyNkZWZpbmUgV0RUX0tSU1QgMHg0MAorI2RlZmluZSBX
RFRfVE9WRSAweDIwCisjZGVmaW5lIFdEVF9QV1JPSyAweDEwIC8qIG5vdCBpbiBpdDg3MjEgKi8K
KyNkZWZpbmUgV0RUX0lOVF9NQVNLIDB4MGYKIAogc3RhdGljIHVuc2lnbmVkIGludCBtYXhfdW5p
dHMsIGNoaXBfdHlwZTsKIApAQCAtMTAyLDE0ICsxMDMsMTggQEAgc3RhdGljIGludCB0ZXN0bW9k
ZSA9IERFRkFVTFRfVEVTVE1PREU7CiBzdGF0aWMgYm9vbCBub3dheW91dCA9IERFRkFVTFRfTk9X
QVlPVVQ7CiAKIG1vZHVsZV9wYXJhbSh0aW1lb3V0LCBpbnQsIDApOwotTU9EVUxFX1BBUk1fREVT
Qyh0aW1lb3V0LCAiV2F0Y2hkb2cgdGltZW91dCBpbiBzZWNvbmRzLCBkZWZhdWx0PSIKLQkJX19N
T0RVTEVfU1RSSU5HKERFRkFVTFRfVElNRU9VVCkpOworTU9EVUxFX1BBUk1fREVTQyh0aW1lb3V0
LAorCQkgIldhdGNoZG9nIHRpbWVvdXQgaW4gc2Vjb25kcywgZGVmYXVsdD0iIF9fTU9EVUxFX1NU
UklORygKKwkJCSBERUZBVUxUX1RJTUVPVVQpKTsKIG1vZHVsZV9wYXJhbSh0ZXN0bW9kZSwgaW50
LCAwKTsKLU1PRFVMRV9QQVJNX0RFU0ModGVzdG1vZGUsICJXYXRjaGRvZyB0ZXN0IG1vZGUgKDEg
PSBubyByZWJvb3QpLCBkZWZhdWx0PSIKLQkJX19NT0RVTEVfU1RSSU5HKERFRkFVTFRfVEVTVE1P
REUpKTsKK01PRFVMRV9QQVJNX0RFU0ModGVzdG1vZGUsCisJCSAiV2F0Y2hkb2cgdGVzdCBtb2Rl
ICgxID0gbm8gcmVib290KSwgZGVmYXVsdD0iIF9fTU9EVUxFX1NUUklORygKKwkJCSBERUZBVUxU
X1RFU1RNT0RFKSk7CiBtb2R1bGVfcGFyYW0obm93YXlvdXQsIGJvb2wsIDApOwotTU9EVUxFX1BB
Uk1fREVTQyhub3dheW91dCwgIldhdGNoZG9nIGNhbm5vdCBiZSBzdG9wcGVkIG9uY2Ugc3RhcnRl
ZCwgZGVmYXVsdD0iCi0JCV9fTU9EVUxFX1NUUklORyhXQVRDSERPR19OT1dBWU9VVCkpOworTU9E
VUxFX1BBUk1fREVTQygKKwlub3dheW91dCwKKwkiV2F0Y2hkb2cgY2Fubm90IGJlIHN0b3BwZWQg
b25jZSBzdGFydGVkLCBkZWZhdWx0PSIgX19NT0RVTEVfU1RSSU5HKAorCQlXQVRDSERPR19OT1dB
WU9VVCkpOwogCiAvKiBTdXBlcmlvIENoaXAgKi8KIApAQCAtMjUwLDcgKzI1NSw3IEBAIHN0YXRp
YyBpbnQgd2R0X3NldF90aW1lb3V0KHN0cnVjdCB3YXRjaGRvZ19kZXZpY2UgKndkZCwgdW5zaWdu
ZWQgaW50IHQpCiB9CiAKIGVudW0gewotCUlUODdfV0RUX09VVFBVVF9USFJPVUdIX1BXUkdECT0g
QklUKDApLAorCUlUODdfV0RUX09VVFBVVF9USFJPVUdIX1BXUkdEID0gQklUKDApLAogfTsKIAog
c3RhdGljIGNvbnN0IHN0cnVjdCBkbWlfc3lzdGVtX2lkIGl0ODdfcXVpcmtzW10gPSB7CkBAIC0y
ODYsNyArMjkxLDcgQEAgc3RhdGljIHN0cnVjdCB3YXRjaGRvZ19kZXZpY2Ugd2R0X2RldiA9IHsK
IHN0YXRpYyBpbnQgX19pbml0IGl0ODdfd2R0X2luaXQodm9pZCkKIHsKIAljb25zdCBzdHJ1Y3Qg
ZG1pX3N5c3RlbV9pZCAqZG1pX2lkOwotCXU4ICBjaGlwX3JldjsKKwl1OCBjaGlwX3JldjsKIAl1
OCBjdHJsOwogCWludCBxdWlya3MgPSAwOwogCWludCByYzsKQEAgLTI5Niw3ICszMDEsNyBAQCBz
dGF0aWMgaW50IF9faW5pdCBpdDg3X3dkdF9pbml0KHZvaWQpCiAJCXJldHVybiByYzsKIAogCWNo
aXBfdHlwZSA9IHN1cGVyaW9faW53KENISVBJRCk7Ci0JY2hpcF9yZXYgID0gc3VwZXJpb19pbmIo
Q0hJUFJFVikgJiAweDBmOworCWNoaXBfcmV2ID0gc3VwZXJpb19pbmIoQ0hJUFJFVikgJiAweDBm
OwogCXN1cGVyaW9fZXhpdCgpOwogCiAJZG1pX2lkID0gZG1pX2ZpcnN0X21hdGNoKGl0ODdfcXVp
cmtzKTsKQEAgLTMyNiw2ICszMzEsNyBAQCBzdGF0aWMgaW50IF9faW5pdCBpdDg3X3dkdF9pbml0
KHZvaWQpCiAJY2FzZSBJVDg3MjFfSUQ6CiAJY2FzZSBJVDg3MjZfSUQ6CiAJY2FzZSBJVDg3Mjhf
SUQ6CisJY2FzZSBJVDg3MzNfSUQ6CiAJY2FzZSBJVDg3NzJfSUQ6CiAJY2FzZSBJVDg3ODNfSUQ6
CiAJY2FzZSBJVDg3ODRfSUQ6Ci0tIAoyLjQzLjAKCg==

--_004_SEYPR04MB682104A5CC12856953A3A11CF3022SEYPR04MB6821apcp_--

