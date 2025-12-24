Return-Path: <linux-watchdog+bounces-4735-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DE57CDC09F
	for <lists+linux-watchdog@lfdr.de>; Wed, 24 Dec 2025 11:46:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 297D6304E57E
	for <lists+linux-watchdog@lfdr.de>; Wed, 24 Dec 2025 10:45:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4253431A065;
	Wed, 24 Dec 2025 10:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IGeNVfjL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HStu8zpQ"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6109531A549
	for <linux-watchdog@vger.kernel.org>; Wed, 24 Dec 2025 10:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766573142; cv=none; b=QXdDWjYjhIAO7FkATNjvuaMNVt1JBO3PQY/ld6OjyzaUpes97IPNyyC2qX5V73lcaljyXY0Wm+DQ3zhQtFY4uHLiV1/9QiavwfHonAXu8EHta6b1+i+U/zAanzpQi61DVZaI8mj4Eyc/FX7HAxOPhAZvYk7cS0k1VZTWiYDmLCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766573142; c=relaxed/simple;
	bh=JkK2WDxkusINBjMjzR+mpI8unpAS4ljvfOmxAvZ/otU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=owjk2uZwF8ijWuTQ4UnOhAyGsUi1QovlSV+S4ZwpSiZnKClgj1LaJKoMgjc/1LNHP+pzBHktkwWLrm6LrWj/c8xPQZNXbVX+QlfIn8jhXfNv0rtS9yrqEluv83Y5Mg0ExjagBkbS7GhC2jRQcFgy2zH7WnrA0JzpL42ZsNjkl3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IGeNVfjL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HStu8zpQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BO9ElDM702677
	for <linux-watchdog@vger.kernel.org>; Wed, 24 Dec 2025 10:45:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XwhD4Sli5tu3cWY9dzskDnVpzZLzo/kU4OteQUdf1fM=; b=IGeNVfjLNk7dQ9bk
	EfMH/rkwILR+kugx4/S7k5oX5C9pfB6wnUy/HrCKrh6MIJiyfQf/d7BwZhTJrhwc
	6W+ZhWYE1284j1nRPkV4uz6Pb7TEJ/5Z3mOadRkVgckfWRmEvWwgFnWThz2oitTA
	2Tvs/RfKKkFUijNm63h9YLLM1QPtLi3+MYD8olYS/bW/R9qOTrb03y9idej1T54j
	xsp7XfAM6R7bGHg3eVZvb4PTfqvlNW8Jt34Yxy566zfCWy9q2AlRRTFODU1wxPJc
	iveV+IZ8p3SPHngm4/wlKMaMZFQ+XdeVhayfRntkDXmJiGnD98lj4Znro40lXrMS
	eb8DBw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7t7jufdj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-watchdog@vger.kernel.org>; Wed, 24 Dec 2025 10:45:39 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4f1f42515ffso139425881cf.0
        for <linux-watchdog@vger.kernel.org>; Wed, 24 Dec 2025 02:45:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766573138; x=1767177938; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XwhD4Sli5tu3cWY9dzskDnVpzZLzo/kU4OteQUdf1fM=;
        b=HStu8zpQqPUF8e6+42nd3UBvVbsMzHcezRFY5CtaPLfbo2Azy3UET9UGubQ5LcIUK1
         AgISdl6QlaZbgzJUR8kzR7/yMZd4Yf+QlsfQ5nUqpHPwj75sjkPAt99YvDfDpnqmwl4x
         rL0FUEEfS3693NkQIfZSmXeZVDFD4jHchZM1mfAAX/zTA4xTRaAKDZ5kI74WGKTFFeAe
         VyeSzmNYnjxUcp9LRvh5BAea2+HpJjMopnNHOdnsq2nlOTK7BcnNfITrPERer2mRD/fq
         tA/aPiG/mMvz3e+eOOSJ19wK74UsmrpUWV++3S5FevYN+nwVZES+6/T5i7SaF/rMAGJG
         ptUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766573138; x=1767177938;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XwhD4Sli5tu3cWY9dzskDnVpzZLzo/kU4OteQUdf1fM=;
        b=jb2P1JZ7Tdk8CzIYQOjgX8UZ8o32AiF0TGs1vS1lfhKL+btFwb1kV0v50LXNjseYn8
         HpYcPtabxZ7Uwrb+4oZd9q3kwuBI9DMmOlfCHlxuc1gKJPO2YfD/7quB0vhhyLwR8d6Q
         HOMQsbDr4qikx7kAGBz6fTSSqH/5rg0iAoF6MTbv6/YI7rNMuBtgiJ+Z1tL7n9kSxppW
         0qx1ai5eIzfQfw0I3S877R+swIm6Gw90MMOFE77H8ScDVILNqLnAOPG/XznseO6bUBeo
         ghO/WwJA012INxXSe/G1fZiE6PrD6FEkms606r0JHp72oIw+nAYpRPGIwOmuLKJZ1WMC
         vORA==
X-Forwarded-Encrypted: i=1; AJvYcCVEB6Hxk1R5i7Iqqcpd4Tj1gnkJ4wug4aJrCRO3cB9xc3hVVSGz5kuiSFTeyRDyHbz48Ft8Avi7S6LNstOopQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz45rsmS1Kcu/w3WYOIFtauNNz3s6sb2t8G4pGEHIgZFKaVjQDu
	L0NI8w1ZuobG+fqb1lF9OTCj+rege6d7Vu8r1Vu4LKedEt5vRoaNS3yzBtBZdcu1ICafku7lSJJ
	R7srgHZx0Gc7GvzZDijkgIzUIpSKhef1FrJHIIv/laf/WoSn0Bv2lccxvtsq+MWRce103IQ==
X-Gm-Gg: AY/fxX4fitJ7AiaECcjW1402UtbBozQavsNB5L/WYZiWnNofb8A9tUoA8nf6+HsArQL
	zrH+4HfJaCOD69xaQbgLb7XpHsGZVvew0fWg4tN2MnWwLs+ztp88u+pARVon+hQXw+RBqz0Fh0b
	edkgn3Trwibiyp98Rk2N1Y2kG61+EXcnTlRW+NWEtlHiKGqOb+6dNzA812l7lp28ixxriSNQGTX
	WvtaZ86dl0sXW8sWx3PgtC9pq7+M+oox4feakyWBZMTVRL9F4ckUX2romLkK3/3Av8xuCmBccrL
	FrkeKG6H7u0QGKsxCNCXVgJje36QzjIeYBiwUAGPTy+Rc9yXlWWoDkRozTN6CuxdqieX272quSL
	KUsNeUdpKHfbn3ac=
X-Received: by 2002:a05:622a:4010:b0:4ee:1c10:729f with SMTP id d75a77b69052e-4f4abd1f227mr261556751cf.35.1766573138385;
        Wed, 24 Dec 2025 02:45:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEiAkVEc4Amsnhds5LCOldsnh1e/WxIElKdG8SFR4ztTSNLfUa889UQ49m0YEQ9WHYJlZXwBA==
X-Received: by 2002:a05:622a:4010:b0:4ee:1c10:729f with SMTP id d75a77b69052e-4f4abd1f227mr261556481cf.35.1766573137831;
        Wed, 24 Dec 2025 02:45:37 -0800 (PST)
Received: from hackbox.lan ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea1af20sm31409049f8f.2.2025.12.24.02.45.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 02:45:37 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 24 Dec 2025 12:45:21 +0200
Subject: [PATCH v3 2/3] arm64: dts: qcom: hamoa: Add the APSS watchdog
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251224-arm64-dts-qcom-x1e80100-el2-add-apss-wdt-v3-2-1801c55d2883@oss.qualcomm.com>
References: <20251224-arm64-dts-qcom-x1e80100-el2-add-apss-wdt-v3-0-1801c55d2883@oss.qualcomm.com>
In-Reply-To: <20251224-arm64-dts-qcom-x1e80100-el2-add-apss-wdt-v3-0-1801c55d2883@oss.qualcomm.com>
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
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=1151;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=JkK2WDxkusINBjMjzR+mpI8unpAS4ljvfOmxAvZ/otU=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpS8RJITaqw3atYKpkoFjqaAAaxq71QkhJ6mBWI
 IDIuKyW3EuJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaUvESQAKCRAbX0TJAJUV
 VsIGD/9deRhr014A8lIKLOSlzhgeKB3Um791Qxvzt6QD5dj1fGWdXKvUX5A+9d37xgAaiDKmmwR
 RUBTN2kodlxDntXhMXUaI1cJRf1o4fap++OlECVaPsJgV8dgSrMRknsyaYRDDWN89jsJZ756Hp4
 iki2iRDFak/Dd106cpiHRN+XS5V+oeTKHbdgF1EQW0+20W/BXRkGRanVb1aJqQHuGJE0GEqDd5w
 jxRlak4K8N1UKWOc6MnXmadWcX159X764z8K6wXVjqQUDhCC3W8Mtfh7NmmF0XgELnacqvpzWVW
 B11woj2HyhyP8u8Izde7Tbdcodvqic8n0pTevEDQ5yVgQ21iQe2I4gO99WRUO6yuDhlt33/QFEO
 eOhEzjJy9nUBSuEdw8JHPPntEFaQb6aMNCeVqvEo3dmDYvbdC1I23DJCtQGTZeJHQJEgLABKFBI
 YQl0/ya0lprtfaxWFfMRvh2paG+1wvfh58c33eqIHCnyeSwlvwDBjWWAwMw1ePIAGMTuJWz3MpT
 a6A0lggUOb07l+RvvCCjX9lraw7jI+RErDZsipgStVr2Z37vo1HcWnh3m8jx8ye+B/lp8mfMTqy
 o8JgN6OjJI1P4s9gltfQhtmAKi4BjaGe++lWFYkRtzt6ChPg5/xNnixXY53FcvHaLEdZScYDdh3
 9iF3sIqa6UjUN8A==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDA5MyBTYWx0ZWRfX0oPdBITVqdgn
 KIk7fQrSt6jAkR2DHLrBLlGDmYV6bpMtnwwTDDVZvYrmp7wZNnr8wiFE+TAdoIt+4M4G4oiF5Ud
 2C+F98TNDV5HNp0ZxPQIsvw168WVVCLb9SJKoL0TzivnCUHDppIGgBbWPQEi3quF4ekdhoS3h3k
 A1GhQd7iRtMrTU8A3yJR2vux5/pD4YatQefalJ7fX2AJXkSVn7QRrPrQ8yKAz5c1BYzNi+RxsNz
 BBH5KgX5aB5++axFp6U2J4Cew2hlDBW5Pi0+GWVpdtAIJYCDutN0s03wJOOZCJ5+O/yOlInbgo/
 xRmGXKJcShBcyBfXQc7RbwOPHeymK21ccvkzqNUco+grKOkx4X84q8TWQpuUzcSpFGDrdGrSsXb
 GWujAW4wVO/MgZ84ckFYqhDQSUBwRTriFjaKoPptzdepwQOTa4sn+aR/oAWKpDvhuydwvK6Ixkz
 0waBLoTrq2ETNDI01zA==
X-Authority-Analysis: v=2.4 cv=IvATsb/g c=1 sm=1 tr=0 ts=694bc453 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=DdBtMnqNxkYIvXj6ev4VzQ==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=bM2Go8iWHfDejGH1_8QA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: AtYomQ7QXFE_EXt9OXqwrBVBgfxumHnA
X-Proofpoint-ORIG-GUID: AtYomQ7QXFE_EXt9OXqwrBVBgfxumHnA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 bulkscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240093

The watchdog support in EL1 is SBSA compliant, handled by Gunyah
hypervisor, but in EL2. the watchdog is an instance of the APSS WDT HW
block, same as older platforms. So describe the APSS WDT node and mark
it as reserved, as it will only be enabled in EL2 overlay.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index bb7c14d473c9..7a1f7e6860df 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -8328,6 +8328,14 @@ gic_its: msi-controller@17040000 {
 			};
 		};
 
+		apss_watchdog: watchdog@17410000 {
+			compatible = "qcom,apss-wdt-x1e80100", "qcom,kpss-wdt";
+			reg = <0x0 0x17410000 0x0 0x1000>;
+			clocks = <&sleep_clk>;
+			interrupts = <GIC_SPI 0 IRQ_TYPE_EDGE_RISING>;
+			status = "reserved"; /* Reserved by Gunyah */
+		};
+
 		cpucp_mbox: mailbox@17430000 {
 			compatible = "qcom,x1e80100-cpucp-mbox";
 			reg = <0 0x17430000 0 0x10000>, <0 0x18830000 0 0x10000>;

-- 
2.48.1


