Return-Path: <linux-watchdog+bounces-4786-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A263D0F523
	for <lists+linux-watchdog@lfdr.de>; Sun, 11 Jan 2026 16:45:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3B46D3041F72
	for <lists+linux-watchdog@lfdr.de>; Sun, 11 Jan 2026 15:45:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88AA734B683;
	Sun, 11 Jan 2026 15:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fHxPrI0h";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EKe/lBoq"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A021113957E
	for <linux-watchdog@vger.kernel.org>; Sun, 11 Jan 2026 15:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768146344; cv=none; b=Jad1Gg2Rlun/bVI0qKlTjks7u77TS5+71EvjRQh6DAdieDRHMrirk/hoEUuMJXOcSpBUWgM0U+Zqu4mn4vmk+Tyz0qwUxfQonnsXSl04HNb3LzgSBBDy2EdVVKXDQVdyBwvaSndO2x/NWT88BtOD0WzMcs92ofuEV52vhgAzpKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768146344; c=relaxed/simple;
	bh=kqEEkCIScR5/MiJUkEOuOsx83FqDEKVFeb98ScMf/b4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ocUAHHqvi0xDr5yFj84St9SVoiTNk+ipgfL/yhsJsdTev0fB4vvNiLDbLku1EHa4S5lavPQrds6MRO5Nv7rbytD1l8cLaKRdC68mPNGSrzJX6ClCcwwJFCl6IhWuk2mOneJT3hHF/wUevGlypMKhDWbuk15K/LK8+IgJWZPvuRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fHxPrI0h; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EKe/lBoq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60BBXBSA1804143
	for <linux-watchdog@vger.kernel.org>; Sun, 11 Jan 2026 15:45:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=MdLFsWjHIZRkAMjRx8XyAv
	xX1n56tujFMjH6H3D6Wb8=; b=fHxPrI0hpdhwKZqcIdv1Lp+YxkCOtUXBqjaXH7
	GiXa8VmOOMXj+e2LujPib7y+GFVR0yBiwZKCiSWR9Ys6FQy+aGZEiNLAWLjZ+8t2
	INis+ujViH3bHqd6uiGTIWH45xDJH7ihkH4V0rZqRrbnaXAU0nWxcYOwNkA9vb1j
	8M+qiEDjJoqygTJW0J4vIGQYk83vgyLtOSqEAf1UDwdZX1j5hD61j4/QvyCjPt1G
	9ikHpYwY4U/URC/dF3dioKEiAeha1d4tyr7mXSV7ZUK13LMyCc7uPoTaXIKxo62e
	+QRkaPWfDfda9hE7n9oWoQ8qYc31SNTVqfgW0f2pUfzmYFVA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bkf57acq9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-watchdog@vger.kernel.org>; Sun, 11 Jan 2026 15:45:40 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b6a9c80038so610037285a.2
        for <linux-watchdog@vger.kernel.org>; Sun, 11 Jan 2026 07:45:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768146340; x=1768751140; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MdLFsWjHIZRkAMjRx8XyAvxX1n56tujFMjH6H3D6Wb8=;
        b=EKe/lBoqDbK4rShwKlT52wJ2zdXyMEv63hwo0V9uth3r7DMKGP3v1LhCI1vH8cKpwz
         BeoumPWMXUmd89VseIr8YmcRwcC7m1527yzivnpESyB+mV2p/FPJnkw+50p8qQ1Vxm5l
         qr4JOjIGpbia9AWz+PkNPAgF6Zpeg/0hzwMhvzFgZOSBvuCaNGD5OWd42dSlItGQWDth
         VwcDywieGgWYhpYQMB5BzegVLIzFfwEkARSDncIcdoi27MA2nHzbXpe/TOAO1oWbRzJn
         37tN4kHxuthQCkkgfEkm4ujcYpFDqW+TXrVue17U76h+plyvD1I7XR1T8sTijfiYmdAL
         yVag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768146340; x=1768751140;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MdLFsWjHIZRkAMjRx8XyAvxX1n56tujFMjH6H3D6Wb8=;
        b=eZkdTBGwbsY/HqgihxTomwmMigVwTnamuWZU20ZFCZumwduN9GmckSU6OCmErn0MZV
         On9wg8iifIUOUWWKU6rwDIiBmXfylVYSOWFObRdtb5eZLPvqPzjAsqDOKkvf857pa5tB
         CoDPaTw52QconbdN/USkbdmhJm+aisEQAu9Rtwo7nQfQulUllIMBpKgEC22hpufKwKgr
         oJX30JEfmegszmQRMM6C3jyLF95A53jALXtBJGF6AU5CjipoSheAaJEP5pEqlXIGuY1D
         jqJSmvbMBr9UF2Zs8UG1N+bXKyfd55DBfnSpYM/rPudYJhEuxfC1UhfmSVMKDMsRsm31
         52iA==
X-Gm-Message-State: AOJu0YyhetuhR5A8nTMRN8ndk8XhHmrQ8KL84vh+FbXclGy3sZ5o3Rw/
	lFpe6rcPBZ1WE8drip/VbGg7V1/YDwFUza8kooCBH76ekFJpasoGNtnno0qtPZTQuR+FGxomOCM
	W+xsNAoUbhxoAI2028Sw8MyozKIzrhwfgrTmtxlgwazhLKaMK7RSEu96+ibwfE2eB9yhuvw==
X-Gm-Gg: AY/fxX6YKe/CcCFdr99gleNjLJpXYQUWjCo1AKX1vpmvD5Bi5Q/sCp7oTFAG9Zyy2PY
	5j2Zi4rUXEpaq8RZ+KeAn+RvDJbeGsuhZFuX2qJJH+lwq3zhfrtC5ZmzU1EsC5ud4RPzMqEV8Lj
	+6JQZzp15NN8a34RUWY3awxdldrZrSgJIj5U52kg02z2/0KpWUPWSyCbO0mVOS0l6Sk1pg9nSWU
	2BZwPaBn2tS98tjg7LJQUC2eUZdnKxrn0oMyGcvUHUfkaEgcMXhB26973Cprh06Hlx9uCxWCj5s
	rrJ04z2tUUgfTSeQNl7ObyWDjgfz5NbTILvxYFa0Z3fwPs98NkLPGAwGFHSEIHGgM7y9PtgHrf1
	CYidgLgfzpVH2f43+EnZEahY3vD9xCA+a4g==
X-Received: by 2002:a05:620a:290d:b0:88f:e620:21cd with SMTP id af79cd13be357-8c3893df007mr2186644085a.62.1768146339932;
        Sun, 11 Jan 2026 07:45:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFW6HzxxfCtPHKE/LZjMIENnm2+RH/Q9xgNhQhcFP5uBiKOWdPXLy8h/mTMmdTVXAX59wMXSA==
X-Received: by 2002:a05:620a:290d:b0:88f:e620:21cd with SMTP id af79cd13be357-8c3893df007mr2186639485a.62.1768146339364;
        Sun, 11 Jan 2026 07:45:39 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a5180bdsm1636605566b.57.2026.01.11.07.45.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jan 2026 07:45:38 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH RESEND v2 0/4] watchdog: s3c2410_wdt: Simplify, cleanup and
 drop S3C2410
Date: Sun, 11 Jan 2026 16:45:29 +0100
Message-Id: <20260111-watchdog-s3c-cleanup-v2-0-fab2d21a2048@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJnFY2kC/33NsQ6CMBAG4FcxN1tCD5Hq5CCrg47G4TgKNAGqL
 aLG8O42DG66XPLfn/vuDV47oz1sF29wejTe2D4EXC6AG+prLUwZMmCMaaySWDxo4Ka0tfAJC24
 19fer4IpQFZUqCmQIp1enK/Oc2TMc81N+2MMl7BvjB+te87dRzu1/eJQiFirJSG9WhLJId63py
 dnIunoWR/wqEmX2Q8GgZJtSMVXrVHOys95Htzu1bLsuCgMu0zR9APWq4IcNAQAA
X-Change-ID: 20250830-watchdog-s3c-cleanup-cfa28bf8bb2c
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1110;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=kqEEkCIScR5/MiJUkEOuOsx83FqDEKVFeb98ScMf/b4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpY8Wblt2WfaTlcEgr1PAwJY13vxMXIFXCCFKda
 xj/csBAr92JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaWPFmwAKCRDBN2bmhouD
 16dPEACXNQ0emQHW5KrqNvcneYbX9caV2GX+9qc9llbIChA+tBS9pJcAg9xo5vO3NT+9ENvIZKS
 RA7l+U6w88Lun43qUQsVSGHb6y1JB2qJ3tT6yG7Dpgv/BWv579cBK6F2ybvBxaJ1JUIcw6Q6t3L
 tLx3VacvpjtfzYW53mEODH5QYUYQrNktN6xvz/KHjR20awLkvV80e2LK7osJYuOES8TKpaa028Q
 CCA/k/xhEeTnT7k6IKah+H2hVfjqEVdnqgO5ZmHPZCNFOLhtYYctnbcYJb4Gwnd7rpS4RaRaaqC
 /vXKyyinTm8NNOFa3YUgQr3x+QCQC0wVBq9PCoyX34hXqirRb6utFArXwneFr+dmDqQiuvFhaHP
 Ef4rD/KVK0CLK0UJ9PaoetzF9aTk7e2VPOF6YP9EIzXcd3LeZ8ZyNoNWgUMe3yMj1TK/xM5uHwI
 iZVJAPZzueq9TElLDaEwaUDiPKWjIt5YpxCcdi8yt0rEHHe9unY/DlLZ/5GuBjZsEpiPNdrC9+4
 YPAUQCmb4HGBtvuHBAGP5uTLd04sFuirS89pRzdTgAaa368ZqZE+kUikZ3Rx2N8BxlrXqwZRCxM
 +qQ0dBoMUTZ3KONPH4w27eos/4g/qvGgE6K3A4yB8p7tEacydJdxYM0xOd5xKKaLvv4rD6zwkph
 vhLC5GvtJTDlc7Q==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=K/sv3iWI c=1 sm=1 tr=0 ts=6963c5a4 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=IkrQgrjNrYqhz69tAt8A:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTExMDE0NiBTYWx0ZWRfX8nzaN7Cb21/+
 zV2UxFuJDvBjthR2Ne16duEGkkITZC4nb0s5nQo3ntjwtQuOBsep1ShHCB7gw/hFlpOEXoPaQL4
 CSdAmrgLYGTrkYxf1QRBk6/vU2XAkWFfhvxTNi5eQgBJzitthkid18LoghzdPJbJSBqFe+5ySAq
 UKtUdKjL7gRhfUHdlWaU0Pk9uBlkKFy3qAohRlEbkd7KkVk5W7fXcviNP6GVIJLHJxoiSHoN9fm
 uZgIaQqcT3M1W0RBlk2qAGx/CSFSZUB8UsvT3pnwWjmlOTj42yA27Stxw9jQQcWfh7KKwxc7xF9
 e0QAGZzWoQ85Tyo69l74LudWCX3UmpHHB4WLPthEtt5UZSo5G0DF6o5XW9o2pJew7WVefhLi2Wn
 6A1sPsKqpQeumfq3Cf4WnxVsJzUmx/4yApSsvtq18+p356MHk+swAtfqsmbR052ZF/KAUkkhQ47
 yGtF1+FWd3mbQGCQdVQ==
X-Proofpoint-GUID: OMSlWzBRcmRlNuv1zv4dNEzKR9CbEewy
X-Proofpoint-ORIG-GUID: OMSlWzBRcmRlNuv1zv4dNEzKR9CbEewy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-11_06,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601110146

Resend because it is waiting for 3 weeks on the lists

Changes in v2:
- None, just rebase and apply tags.
- Can this be finally applied? It's waiting for almost four months.
- Link to v1: https://lore.kernel.org/r/20250830-watchdog-s3c-cleanup-v1-0-837ae94a21b5@linaro.org

S3C2410 is gone from kernel, so we can drop its support.  Also cleanup
and correct a bit the bindings.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (4):
      dt-bindings: watchdog: samsung-wdt: Define cluster constraints top-level
      watchdog: s3c2410_wdt: Drop S3C2410 support
      dt-bindings: watchdog: samsung-wdt: Drop S3C2410
      dt-bindings: watchdog: samsung-wdt: Split if:then: and constrain more

 .../devicetree/bindings/watchdog/samsung-wdt.yaml  | 72 ++++++++++++++++------
 drivers/watchdog/s3c2410_wdt.c                     | 22 +------
 2 files changed, 53 insertions(+), 41 deletions(-)
---
base-commit: f417b7ffcbef7d76b0d8860518f50dae0e7e5eda
change-id: 20250830-watchdog-s3c-cleanup-cfa28bf8bb2c

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>


