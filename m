Return-Path: <linux-watchdog+bounces-4733-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 63722CDC081
	for <lists+linux-watchdog@lfdr.de>; Wed, 24 Dec 2025 11:45:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2FEAD302CF62
	for <lists+linux-watchdog@lfdr.de>; Wed, 24 Dec 2025 10:45:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 889683195FB;
	Wed, 24 Dec 2025 10:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CvVN0a0L";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BjIHIHMo"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2C1E316919
	for <linux-watchdog@vger.kernel.org>; Wed, 24 Dec 2025 10:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766573138; cv=none; b=vEve+GLDCt4cG8+iE0qR7lxcXKAYqmaHoF/BbdQglzXe57hQwSiPjPiQLHkAqm4o+YP6dwqGzE1FNANRyOsp2f7aAimx2cLiXJzRh5MBTrHUud6HaZaCQ9DeAX6dflaYE4PRqgxjDffXC+gnQ7eJdsmiVlw/YBz2/o7bv5LG3+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766573138; c=relaxed/simple;
	bh=8++ri8pNA6pzxTy2BoyMB8YwFnujDbCAxbYE+6SEJnk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=NzpIL7pSrmb6CN1fElsRbn41CpV31xgNBHnU2gzrRUYQvn7EoJrHShW7knzBozL61J2Iq3IbabGQ8BXx982hpOoZ9/figpaA06Z45VW84xf8pbvVqrPlWw6DgYZ/jDpni13YM2ElXlHRKrjWyoQWeKAFEatSUlwVOMN2uaCsQDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CvVN0a0L; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BjIHIHMo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BO8m1hH1206657
	for <linux-watchdog@vger.kernel.org>; Wed, 24 Dec 2025 10:45:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=gz8LD4Kq0JpWzUHIsBMDrk
	Hm+q9d2aCH+IW5uybNcmM=; b=CvVN0a0LDdLBFvi81Qhg9QyDrZjsd6GZocEsfg
	0iuLJiUz8HsKajCM2/nSFdFvEPK4t8zSr502f7uHzwyk5hA4XGY0GHo01vPa30so
	L+EAnGzK4TcyRrSpnPXX57XBAtXycof9o4G147VSYUJinUb+JpG/zVUMhzbMlUpK
	n+pAw7VnuH1uw1a1r0SUlA48yoYTYPsnN6VeW7Dw6bDc8u6wymqPV+G5VlqK5lar
	yRg+2DebxP+hoMo9+Mf2CP/u88NUgnGs4cEnWNXIOGo8cdAb7yvH4RzlF7p9fbPw
	Z8xAw1YZdxMdjtzRMBK6p4Sli2WzdP+tcm/HZwH+JXvNaNiA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b827r1uyg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-watchdog@vger.kernel.org>; Wed, 24 Dec 2025 10:45:35 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ee21a0d326so35030811cf.3
        for <linux-watchdog@vger.kernel.org>; Wed, 24 Dec 2025 02:45:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766573135; x=1767177935; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gz8LD4Kq0JpWzUHIsBMDrkHm+q9d2aCH+IW5uybNcmM=;
        b=BjIHIHMoy7yOF4BE+Paa6oV3/DrxucPpG9q3KrQnQwLeoHHil6iRZayss60iVkdxVU
         LmAbtf0DKiMOSPagoeXBs5AXNHWPBVdcE5YJ5Uo4h1rlXsqotFikbg5rNEhokJ244/Qv
         Qb9UU5IsSvX8J5TuKUTSdU1gOX/k2ImqbgFd3r5mTaL/51XtyrqBaQGKk5G6t1nqVL3r
         D00MKFs6KH4PQarROcJ+HXJ0awUNkkqwQsqZmwlrNVGPylMIskOQSHaXHbKvv39C59o1
         5Vz7g3Es/QsvdZyWdZGcA8Xi+ocZPlG1wp3btEen1rYAG2sB0+hDI0Gp/FudE01kDGxI
         ilew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766573135; x=1767177935;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gz8LD4Kq0JpWzUHIsBMDrkHm+q9d2aCH+IW5uybNcmM=;
        b=f4kKzcLeasVJhRsYz6l+QwiGTgVzCSumYHdulOxtvIHoW0IN2lxMW+gIh3IiYHUycO
         p9KdwPmr7b/ezgFf2Gw3FOHUuu1CYfKCPP36nYHDWr07cRam/6G9kshHbtp4EebeVPK1
         50QqKl38YgenpuHEv54/qkzPBfNLC1ymJ6w4sF7KcH6Pbnx4EPwk9uFrDpsV04BpmX++
         3gu11EKHD7j+4bfQHymPmZ44QkowZ/b90k4L7viKsa34EdH6ZGmK8w4sHvY8NrMYWCfb
         ulUYiwqmlNkvH59o6Z/MIpI16u3lKTRDsblZaYb8JcKrRftWO0KEZUIhKi7bDYV/Q1PD
         dQhg==
X-Forwarded-Encrypted: i=1; AJvYcCU+1c7lWYxVffNphNijzNBNuxaPnJCxXGxZ5DXJtxhYnv8pqKs8aj3ZQ/5UeLaeSXXQHHz8WD23GSrqZJf58g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2fF++kDYwVVBVDsjQJw+3N01LPOZ6AooStbO1akg0sGZNjLzW
	CINqTL6SM+uonPZaW/ii7RVaFMDn1/w/t85XEvWOYZl69J0E58LVFNThtvTXtZbGUNfQ7eTXqrO
	SvUxa0WnX5SjwTbrxcjxTVkCkk3XAUXiaFxD3vuGz2KJKLf5wpZqUsTUmSaSg1XfgLSGjdw==
X-Gm-Gg: AY/fxX5n/BS3P00D8q+OzyFHsYh62lEGC4egJdBnkfpvm2VQP4RaSnt7Qcc1tcvEloY
	OaOlkCbj4OjIGBf+1oSzh8rb+/xvshcohfGcg3CZg6Vs4bBWsy/kuZlAaEqhae2kftKcIv2yk19
	X5nn4QHJmUSwSqvUPmAnoLam/QYXtxRV0J8NBs/cLjkDFBfqkB5lEMkvdwObadJG7oglBUuSU/W
	d1lL1SiUbacqU9KIHW5e34n4bHOUNA/KcIp1RwNCWEmemCkt5KEsYzpVjGD/6tpkU80BAuEG0ph
	nw+54WOiwnd+Rimrz9+ta17FtErse5XWtOFLQhbVBaQR9lalgsv0f7J9mYJEZiOif4MF/kNpnKI
	vbLbHDPIUr+hj1H0=
X-Received: by 2002:a05:622a:5c8a:b0:4f4:d295:1f53 with SMTP id d75a77b69052e-4f4d29520edmr116604181cf.84.1766573134963;
        Wed, 24 Dec 2025 02:45:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGQF4JNjSknKeKVVIQudU4Ec0psJIi/Qk7dhjxYYVrrhed4DIxw4YqTG0UU5USP7rPSApHlFQ==
X-Received: by 2002:a05:622a:5c8a:b0:4f4:d295:1f53 with SMTP id d75a77b69052e-4f4d29520edmr116603931cf.84.1766573134470;
        Wed, 24 Dec 2025 02:45:34 -0800 (PST)
Received: from hackbox.lan ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea1af20sm31409049f8f.2.2025.12.24.02.45.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 02:45:32 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH v3 0/3] arm64: dts: qcom: x1e80100: Enable APSS watchdog in
 EL2
Date: Wed, 24 Dec 2025 12:45:19 +0200
Message-Id: <20251224-arm64-dts-qcom-x1e80100-el2-add-apss-wdt-v3-0-1801c55d2883@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAD/ES2kC/52Ouw7CMAxFfwVlxihJS6BM/AdiyMOBIEpp3IYi1
 H8nhYWBBRZLV74+xw9GGAMS28weLGIKFJpLDsV8xuxRXw4IweXMJJdLIUUJOtaqBNcRtLapYRC
 45oJzwLME7RzoKxHcXAfIS6uVrSrPPcu4a0Qfhpdqt39n6s0JbTfxp8YxUNfE++uXJKbeH9okg
 ENVYt6btTW42jZEi7bX53xXL/Jgkz3JT371A19mvnfeKqOVKlB94Y/j+ASlOftTWQEAAA==
X-Change-ID: 20251214-arm64-dts-qcom-x1e80100-el2-add-apss-wdt-e04ca6c99f0f
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Stephan Gerhold <stephan.gerhold@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=1720;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=8++ri8pNA6pzxTy2BoyMB8YwFnujDbCAxbYE+6SEJnk=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpS8RB4oDksQHNliQCSKnF01yyWlYcXmVfd+QEz
 O+lZ9g22OGJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaUvEQQAKCRAbX0TJAJUV
 VrOiEACSmok8KK904KvZB9RHLbcGxf41+OdYEVgJY5lw14l7nFAzrkWIJdXppqchcQ/TunHfksE
 Lm4SVw7WerhoN0TGOqC2lC9SGwUU7jOm9Z2KHe/X9LiwTQObgr/r1Da0M2eC3R7AbBd3ix3IofM
 De5knIZbxbi1UViTGKGmGooOTK/RXG+fUpqXjJyLflnFYptsoc31NO3wDP8l+IZ64mrfpVnat9j
 A0dDvLZe0KLTcvrAMoU29qj+fc051vppeuXkme2vVUPT37uK37L8sd6mdv3hJWuXS6hln/Tyr8C
 mHSGyWkY0ZEieH7EIY6vULNqgR7eSc1wUupQjsutU5c3LFHawwzua/rixubTwQep0ZROQUEAGly
 lnD416HgVRglhG++FaoPe5Pxi0w6xa/CDHlILm0sE4sFz5RO7WmFv1CsOTstQhydzbcjYNuj+qv
 ID9KRh2oBmvi73WK+Sp2N+Ks1R3FpfiPioN2IXfUL1hxdvko/jwr0k7UKLPew5Wui4Jpj6mWqrm
 0bZcAGmLvLYAoJeETeAmz4Mtz82VIXHiBcGNPBDXvwfTkOkArsbSG3c5wWngsgizCrv8c3dVlfs
 KNhPVD5/dhLZqckqzH2yUQX8VIDxZf2GUoqWzpn8wY8uYPaJ8i2QT9N3B2iEldHI9pIJ5feiS5+
 O3eA+GHh007t/1A==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: 30BRrmOv3iXWIDWunwqAk2bYLI-s_P-P
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDA5MyBTYWx0ZWRfXwI+pjma0qXpy
 gqrljf+EEhdpd334ylamHd2ZCnlUmTf9Th3Mw1YOMkGEfkWt1PAzbwP5QBVKaqCRoeCwVlqWkLY
 bw1SChTswbuyaD4kdP2Dnwc6wbShanfFR87HXDd78bwdFi2eIUjp9vhhTiRH5FAQcioyGvDJXxR
 FLdW3Ybyj4CpbPoNw38Ng4dkHy6RDr8yPTiI3KjpwrmfRrzCAEl2n8SJoapM00Jb63vaz5Es6H6
 Eha9TVeTFBuq9xN0MSCrvj3cr0eDKl9qLygpb7oDLDl51wJeXMm8LNZoY2JRVI+XRZLV9uvy9Nj
 nWsi/IAjTgp2pkvT28BnkQbKrLj95m+vGeLZF0RlAMnku+3UU75bcW4GKDBZVBn/uRE5S7zU+eF
 vQex0O9cr8PtUf7IDkSaG8ekJvCREYJtC2icJVJCrrGMkY/mkOJlnTjqM4X7+r7F/bqL5p7xxcP
 VbbPv6TvpOzaP/JQnMw==
X-Proofpoint-GUID: 30BRrmOv3iXWIDWunwqAk2bYLI-s_P-P
X-Authority-Analysis: v=2.4 cv=RbSdyltv c=1 sm=1 tr=0 ts=694bc44f cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=DdBtMnqNxkYIvXj6ev4VzQ==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8
 a=Lz2AerfunYj4_YM9ZqwA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240093

On X1E80100 platforms, in EL2, the APSS watchdog is accessible.
The APSS WDT HW is compatible with the one from SC8280XP, SM8250 and the
like. So describe it in the SoC dtsi, mark it as reserved and enable it
the EL2 overlay. Also document its compatible.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Changes in v3:
- Change the comment for the reserved status in the SoC dtsi node
  according to Konrad's suggestion.
- Picked up Rob's R-b tag and Guenter's A-b tag for the bindings patch
- Picked up Dmitry's R-b tag for the dtso patch
- Link to v2: https://patch.msgid.link/20251219-arm64-dts-qcom-x1e80100-el2-add-apss-wdt-v2-0-fdfc6ba663e6@oss.qualcomm.com

Changes in v2:
- Moved the node in the SoC dtsi and marked it as reserved.
  This allowed dropping the interrupt-parent property.
  As suggested by Stephan.
- Added separate patch to enable the node in EL2 overlay.
- Picked up Rob's R-b patch for bindings patch..
- Link to v1: https://patch.msgid.link/20251214-arm64-dts-qcom-x1e80100-el2-add-apss-wdt-v1-0-94ee80b8cbe7@oss.qualcomm.com

---
Abel Vesa (3):
      dt-bindings: watchdog: Document X1E80100 compatible
      arm64: dts: qcom: hamoa: Add the APSS watchdog
      arm64: dts: qcom: x1-el2: Enable the APSS watchdog

 Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml | 1 +
 arch/arm64/boot/dts/qcom/hamoa.dtsi                      | 8 ++++++++
 arch/arm64/boot/dts/qcom/x1-el2.dtso                     | 4 ++++
 3 files changed, 13 insertions(+)
---
base-commit: cc3aa43b44bdb43dfbac0fcb51c56594a11338a8
change-id: 20251214-arm64-dts-qcom-x1e80100-el2-add-apss-wdt-e04ca6c99f0f

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>


