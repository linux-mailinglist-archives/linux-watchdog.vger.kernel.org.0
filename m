Return-Path: <linux-watchdog+bounces-4736-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B0267CDC0AE
	for <lists+linux-watchdog@lfdr.de>; Wed, 24 Dec 2025 11:46:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DC00E306C2A0
	for <lists+linux-watchdog@lfdr.de>; Wed, 24 Dec 2025 10:45:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 713D231A549;
	Wed, 24 Dec 2025 10:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mOxPQeps";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L9FRe980"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55CB831A07B
	for <linux-watchdog@vger.kernel.org>; Wed, 24 Dec 2025 10:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766573144; cv=none; b=lObkIZQs3jvwy0Knnq61uKKca5nluMxaUPoxJbrhagbxMfOIWt0hrPuCzjtTgIIQ8MQ9sLGHQ82GjSozdWwtORhu/qz9/p9S2ey1to3NwCrHnBUcCKqNorJaSRZgl4IzWmI4QfRYQScFn3RCwDf00CKXdi+Srl0NNggkqoFT6z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766573144; c=relaxed/simple;
	bh=9u/qqBon57yL2EaNXdmClyaMiBUHH5xKRFQlLD2qZlU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WjUN6Td8s9oASkfDONFgrfsvwdySmdqTP0zvLMZKs10QL89OzKtcI1WUmpk7rSX439iro52WKFwgXGSDxRxSLlmhPImBs6DHbIlSz42U4QQ+2iiBunuG/xnsjC+V9N9yDtQiEN7EFruTwtBhSt859uOTru4919Z3BW+xZHcBC0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mOxPQeps; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L9FRe980; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BO3Am8H913618
	for <linux-watchdog@vger.kernel.org>; Wed, 24 Dec 2025 10:45:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CukG9KOto5njfgRIbvFQ4XRvxuyoNrKpsa9hn0J/8DY=; b=mOxPQeps3L7ukUkI
	5oCGEbzQ2DEmSNtdSO3n6eFU7tK9T9tamhuJF+4mpgDzif2S+ZTgUjZNQJbUuuAq
	fExXPR0HO9LuKivFae96mkykcshPMnqtRcb9jUkwF89ztR0DEKAbn4mwAo45esPZ
	tx8Yd+OpUjiHbMqkiT4gudkjXkM63bThPfCBMjNjK4M6gxLB9ZB2RyAoOhHlFmBX
	8q7BWXPFl8K01qfgG8is2/+p5CG1kfctsbwmr0R/pCzVbZ6WFRqWDZl0N5GZYhPh
	rAs5AbxLjn93d2WPtk2zS9iua2LYhnkVCEuS9cbNoqYK8fr/5Gnqg14H1qvTZzHs
	FI/lCA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7vt2jy3n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-watchdog@vger.kernel.org>; Wed, 24 Dec 2025 10:45:41 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ee416413a8so63309011cf.1
        for <linux-watchdog@vger.kernel.org>; Wed, 24 Dec 2025 02:45:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766573140; x=1767177940; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CukG9KOto5njfgRIbvFQ4XRvxuyoNrKpsa9hn0J/8DY=;
        b=L9FRe980+/VxnFhgAN/FkSh3clnbem1mxB3n3JcwjbLf4AYJm23VaFtUXqWg7kIuFi
         j/YV93k2lBrgy21ceQx6rH+nOwDv0HAk3rVtx+FYTQy2mBNlLr5GeZdKlKvfUB3jzfJz
         oI6VLtkxJdABHNeVd73tz0oXRfLBHxzKE5/Oeri9VWADeucvUF/B6KOMK//cxn8koFNk
         ixQgiXtvGAjrelNyH9ZdBG9dFpjNjdt0DZ1HqNjdkW+cKAd4Wp8o1u1fwNhGhgTttbEV
         zrBD7Nswgv2SiP2A8WBYz9rjppVTOne/u88Z7K9Z+TW9DUyispl5Lec9ITsdFhR2lsOT
         prgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766573140; x=1767177940;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CukG9KOto5njfgRIbvFQ4XRvxuyoNrKpsa9hn0J/8DY=;
        b=HI3orb7CyT2onsmK16Uqh2XIMoM6kx2R6/D5pONSDwfMsmqG8IL4qlirKi3O2SgYsU
         ykaAwx6I9AMbVMkdQavfC7AoL9txFGTXj92LeIsIp1jELod33TmadymXtj/YxA10Pim9
         T6Buz2u0MuxFcDcnLBva/29ryWWiju2PNL2Bq5RjsC7B2L+F10BMTUvkCUVWfD6ktvyd
         Aqma5dfNC634MUDVIxpWV0rUnbrGac96eysmhDZ3v2J9Tpk0uolgrtYKWJijT8eTOoDV
         rBeiB/Rtjspw8gmPK/eafPkruUrgiQtPKyk5ebY6eblNmbzeuA/TMrLtXnfMZcU5Ik0P
         PPjQ==
X-Forwarded-Encrypted: i=1; AJvYcCU8icUzA+ESsbAty3Eywjo9irf2N0DXdVwIAJ51i8qPlX/uN8twqLkrlz59pDG6XPfAmJMqZBPCl0Or0bUf1g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwmRRh6mi+MUNN/yl11cXk0tXCyhZ3NHkwDQQAFLrWe94Ioyc+V
	WjVLc3SdkQIjKQflB94zHTqGwk53lIrcIo/d3+xiE3vVTp0juil2S56toIV8ZSLaetDmbSZJAps
	R7ORvb22X8vi9ev034j6YOqJs6ZkoZi51FB+zXG+dcy53NdmsWEbwfHGN1mymApvOgIYaPw==
X-Gm-Gg: AY/fxX4OHhAJ9MNsr5xvVfMgu/lZogpIssYisR9WTr8YCc/qU2gR/lHEqLjetPiHIgx
	di4oIxOaV+enPnESZ//J4ViGvCpJ6I6zk7nZwwechg6FSOe4wb6DEDuB3TEoEK3/xiX52eA4Pg3
	AAPK8zpnYTuHTiksWqRe9hhrgWSsNOMoFON/5JElAwaUOgJ8xndRS9YVBWsm1Ninwg4FN2s7SMc
	O/m+v+Ll+eCnEYzsCkBJ88H/uI9e00uPZPSD8qUPeKgzWZsTwwm4nmx7rlcD0Z6JyHshKxU/2XP
	qfp5Q+adcqY3uLIVwidQj3nbnJZ3G6uXgSv+d7o7HgW3pR2xXYYjO+Lmzy2ZDC9MZxDui+pqaOD
	XrFrV+pD6ksdHOqM=
X-Received: by 2002:a05:622a:480e:b0:4f1:bdba:8cfc with SMTP id d75a77b69052e-4f4abd942dfmr262742331cf.65.1766573140176;
        Wed, 24 Dec 2025 02:45:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFibR5pkTslh40h+ZcnymlQamAns3t6y8yI0c3Rusi3+VdIjl/s7KDAOHxLF8x+9JIRD5quQQ==
X-Received: by 2002:a05:622a:480e:b0:4f1:bdba:8cfc with SMTP id d75a77b69052e-4f4abd942dfmr262741911cf.65.1766573139623;
        Wed, 24 Dec 2025 02:45:39 -0800 (PST)
Received: from hackbox.lan ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea1af20sm31409049f8f.2.2025.12.24.02.45.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 02:45:39 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 24 Dec 2025 12:45:22 +0200
Subject: [PATCH v3 3/3] arm64: dts: qcom: x1-el2: Enable the APSS watchdog
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251224-arm64-dts-qcom-x1e80100-el2-add-apss-wdt-v3-3-1801c55d2883@oss.qualcomm.com>
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
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=748;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=9u/qqBon57yL2EaNXdmClyaMiBUHH5xKRFQlLD2qZlU=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpS8RKK1nJCK44CCrErzgbwKgjC5Zp45MJ4Z9gA
 P6djnAdmoOJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaUvESgAKCRAbX0TJAJUV
 VtSHD/9jNMmkt7kdF1xehh9sEFK3XyAWnVKAVekYyiZofwVJ2FhBEmXMwt6ofoi1rvr85jyWcEV
 OqAbf90sw/1ZY4x7hz/NHIh53L3uSkhfGDQOYasnO62d1zqGO3eKq19xEzC8DJw8lVSuaC+BRSO
 SPZCpRcmfuHq7KTiaS9RpTjxROiXm8mTABMwsL+hbuXkdJE9a945nd8j8Lks82EfBHIeaQ/cM1Y
 Lp3kIyKy5SWN5rNkNEn4oVpUs2dlDlpI0AMPZ83OEuCRv95k5LDTdT+M/v4M1572wgKGBi/T7Rn
 7mH2fACrKHODyCasAkflIznzFuoh/KqYRwzQBNAvK4fm3G2NShfcmKqRFsYMNWKOBa+j9ypeFEV
 3aLJOw5/fxKD8kDaRSnKxy8JFhtWN3u21SKinfF2VxwDagHNPUy/ild4ikGAc4dYb6f6rKJeX7i
 h5FK05W4epf0jLD5pLoXQg1Xu7E5YR3zyYJVgna/tX0kwDQY7udllogB30k6cHO8X1ux8m5fFb2
 xEtCmhEd9WBQkY8bdhhvbTYmmmO+Ar//kFRtOhM95pze32RdZ1J51tE40F8aa1CDV2k84e0i9a4
 IEveeABilc3WEiIAjLMeYkKcyUzpkag/uSr2I9QtO48tjKRHzDz8ow7PIlI+imJl5lLF8Lac2SG
 wYS4/B4suSGNPiA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDA5MyBTYWx0ZWRfX9VTjdXgK0RYd
 wjl1um74EJEOZ+5JpsSx/c4D8tKwE+q/x0Z+psawcPsHELHmikzAKmE53ypKxqRuSL0DWgevK7v
 09kHG5ezry+vEZvWedTscp6LEvW5k+QqTCuXt/dSpjamIrDhFbFWwDw9LAUoCVDgwAVxqWOZUKw
 VBs9trP/fjSsYU0QaVrDH/nV8bhSZ4nlFAgzMaXSHT4mGVBXWxtoq1yiy6DWoV6wIG3lkVzxU/6
 IOWEfcC3brtsHQVCpSwpUvujxQ4OJfn8lZTlXcs10iM6PDc02xbVXB01wuWSyFG3JdJadKAftsz
 xCMpjbMg18WfCu7IyN/JjgAiHDENcyET3l1akcsSiJ/svLlC36OagrqdCSafzUK9vbsdh7qAOrb
 aaQbXMNFZs8yappACr57Mez313PrM2WDLLMrJO7hG627PFS9N1WNQ4aXtVu2nKRUnm5LDePnMs/
 jhld4O35zLe2powW/FQ==
X-Proofpoint-GUID: Jf1Qb9ewi_9MWaumibsoT3bsLsYIKcOg
X-Proofpoint-ORIG-GUID: Jf1Qb9ewi_9MWaumibsoT3bsLsYIKcOg
X-Authority-Analysis: v=2.4 cv=brtBxUai c=1 sm=1 tr=0 ts=694bc455 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=DdBtMnqNxkYIvXj6ev4VzQ==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=FZ1xxrKGKg_zhwGc0gQA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240093

In EL2, the APSS watchdog is available. So enable it in the overlay.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/x1-el2.dtso | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1-el2.dtso b/arch/arm64/boot/dts/qcom/x1-el2.dtso
index 2d1c9151cf1b..175679be01eb 100644
--- a/arch/arm64/boot/dts/qcom/x1-el2.dtso
+++ b/arch/arm64/boot/dts/qcom/x1-el2.dtso
@@ -7,6 +7,10 @@
 /dts-v1/;
 /plugin/;
 
+&apss_watchdog {
+	status = "okay";
+};
+
 /* We can't and don't need to use zap shader in EL2 as linux can zap the gpu on it's own. */
 &gpu_zap_shader {
 	status = "disabled";

-- 
2.48.1


