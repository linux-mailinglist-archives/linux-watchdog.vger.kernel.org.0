Return-Path: <linux-watchdog+bounces-4700-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B13DFCBC013
	for <lists+linux-watchdog@lfdr.de>; Sun, 14 Dec 2025 21:50:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 70D873004415
	for <lists+linux-watchdog@lfdr.de>; Sun, 14 Dec 2025 20:50:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CD932C0276;
	Sun, 14 Dec 2025 20:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BJpRkwwE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QEwAWyiF"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB6482798EA
	for <linux-watchdog@vger.kernel.org>; Sun, 14 Dec 2025 20:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765745414; cv=none; b=UP1hUlQMSkyNedgUzkTAksU7IhUzGojNNY2PdgKAGHdcMWS02590zXCUTsDf+teZHYtTvpPp1FCRBCDrl86iT/H06w024n09Cw3hArhVguCEfZfyeIWADzGYJ2+whdn7qzUsm+2+wbgGmK++AJJnCur0ZC5NFjnJemBaEUD+UPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765745414; c=relaxed/simple;
	bh=D5gfX72dcbftJiT9jh3/QxSSyV9CVVWGK6O49XWgWbM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=qWICLRzp+5cXvqKwco7QULTwgwDUg2fOjeWRj6pV0pDtfBb47tOcfLqhFtZuNQJrIzp5vqnj8TLUZvs/3+eeEIs7GFBtGjS2zZanqwB5SSR5/u4UsHKbKd9MEItwbViIGOs8BY4P/Q7d4D7LjSKauo+xAE1Yp2qvAbKCmn/LK+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BJpRkwwE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QEwAWyiF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BEJUSHO2419835
	for <linux-watchdog@vger.kernel.org>; Sun, 14 Dec 2025 20:50:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=BDZjFfiv2zQi++NCLg14+N
	dxaO6iLJspQfu01S70w9k=; b=BJpRkwwEAabDEngUb9Um8VJdL4Ixd/Tx/ceby+
	Kp0B45eka6PdOMP+UuFRAB+qJgI5jbY/GLFJKDlQ1MklJDrf7T3MbSI5y0mnpMOr
	7PP+n4U15ZEd5ko+OtHcs+p9qmLOMlZ5OdkGPeMHmF8ImbppHL1vYhkNdG/NWMWn
	KgtQFVTkuVnPKbl/+PdJF+nY2Dp8oq/dKGjdnKYnDE8L7NidcTfNHqttAzdhBxXa
	CCXmluy0juE560tsMOIGldejc8VWxr69iarmq5kISRl6RVX9QBxvJQCFPmpwlAWo
	UxiDHPTVYqrFRz2kS5G/lGQ1hdgTaYrdPQkdusxrhms9EgzQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b119t2fsa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-watchdog@vger.kernel.org>; Sun, 14 Dec 2025 20:50:11 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ee04f4c632so54529231cf.3
        for <linux-watchdog@vger.kernel.org>; Sun, 14 Dec 2025 12:50:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765745411; x=1766350211; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BDZjFfiv2zQi++NCLg14+NdxaO6iLJspQfu01S70w9k=;
        b=QEwAWyiFptlmEqY2PY9JqF958QZ9fHo1iqw9w6mOt4GZzDWVzzjLhDj/uvszKMt6Ww
         NVZ/KbkTaGUHnWvFRMKTR9q3i22nUQ0GVPdqufkDJbVbJsizWeSXx2YP7gVhSD/atq9H
         T42dDdpthBzboYqhqxv0FuL81M8nkYxTD0ICzpCDyajk7Fg0AnvdBDrUzlK2P6goD0pc
         zJmzGdKcAtyCkh4iz0AIdqJ8FsGfNmqTdjFdOLkmThqUy+Yd5bJmjiIvFHE09OYOoOYG
         AIms0FYqPCLEJ/FsOznaHTQzOwEnjCTCD2J/3Fs6kgRkCd51Nbi5XtLpB8qDhgtBDqH1
         nLGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765745411; x=1766350211;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BDZjFfiv2zQi++NCLg14+NdxaO6iLJspQfu01S70w9k=;
        b=AQRUBMtzzVuKygetKKyRza8X0axLAg26KPlrW8jkayz/3FZ1q4xKdawbCHzJcsEmcg
         CGv5it1a2uiG7Xu2rfA0wUDYKUA0ln3JUAJYSx3ld0QZkU+g8pOCjZ4lwvPHLSMwse+8
         78co4z2UK4X4u3TvbJIuvkV1nTKM4DSW43qdMzuvl9ZqsSXaSbdnCr3lOsxeGzmOs6LA
         oS7XN00AVeA1l7Upxaj80TK0NvGxvmSsHRKV+bt2IFAgK9O8u9+D7wd6QLQY8aJdkpPF
         8OtwjuVSzIoAtmfBPuxGGoZu48w7FRK0JqAGOFQBMGR5QK1IAI1RRfgCa7K+bCPpQs6s
         441g==
X-Forwarded-Encrypted: i=1; AJvYcCXpmfk2JiobrciYRm+vM7Bqntie0ye4fL0L7qJMrKu768JRlqIpDD6FS4TGjrGuur2a5qODkASZtxLwAbiqNA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzjxBYH5iIH580OW0Gd8TdrMDoafmudQS4v57pE7pqn0Ey4BGeW
	jcTroI9GvJziwhL7l9rSbbGp/u1GlK9iLXeMhO3o8K3YWZOcHOYG9/j+K87oAkwByCwcVrTt1j8
	Enf01X8YcsWUMnSULGlwskqxQztYAgwnh3OIwsSDbAi8XGblk7n/awGReUdMCWhhVmnfJvA==
X-Gm-Gg: AY/fxX6V+Tk6LemDrxKQiExH5jakw8WuzywS1QJLWIfsjHZQKg0XzpYzDcqHy2o5o6h
	Hvu/YghLrA4O+1USRCheUxjjo6gU1CvPn6yC2qrh2U3jNYFTR9FcAPHOuyoniQiZUxeQGU9Hauv
	WLQBsgt8zwFglE3aedGB+20i1NnV2q0MutEHsjrFm3J0+aV5f13yA/NQjf1TwwAVTKzVHZpGVTI
	Wy6orHA+MbOms78NfEjMN0XGHqrJzFIUxbBEoj/hWacdSzHVagSLfSsjRbXAig6EOXOtbVZXbMQ
	B+OxtDRXe16Z9ny827SbrQE0GSzMkhnTXY5D1yNGiBLIwWePeOG6/L4R+7IpMm1Dnmb8Nf07Qjn
	YmXiowoHzMIw+TT8=
X-Received: by 2002:a05:622a:514e:b0:4ee:3e74:43d8 with SMTP id d75a77b69052e-4f1d05d57e9mr116168631cf.38.1765745410839;
        Sun, 14 Dec 2025 12:50:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGBlljZj+Llgtkdz+sLCPPCXCteLK7/KkEBADIwgrEe0+k3ZIqA60CM0VLitQCSBuDGQ5EkAg==
X-Received: by 2002:a05:622a:514e:b0:4ee:3e74:43d8 with SMTP id d75a77b69052e-4f1d05d57e9mr116168371cf.38.1765745410193;
        Sun, 14 Dec 2025 12:50:10 -0800 (PST)
Received: from hackbox.lan ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7cfa2ed80dsm1206316366b.16.2025.12.14.12.50.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Dec 2025 12:50:09 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH 0/2] arm64: dts: qcom: x1e80100: Enable APSS watchdog in
 EL2
Date: Sun, 14 Dec 2025 22:49:57 +0200
Message-Id: <20251214-arm64-dts-qcom-x1e80100-el2-add-apss-wdt-v1-0-94ee80b8cbe7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPUiP2kC/yXNSw7CMAwA0atUXmPJiUJFuQpiYRIHguiHOIVKV
 e9OgOXbzKygkpMoHJsVsrySpnGoMLsG/I2Hq2AK1WDJ7o01Djn3rcNQFJ9+7HExciBDhPKwyCE
 gT6r4DgWFnOfWd12kCDU3ZYlp+a1O5791vtzFl28ftu0DS5v/R4wAAAA=
X-Change-ID: 20251214-arm64-dts-qcom-x1e80100-el2-add-apss-wdt-e04ca6c99f0f
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=784;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=D5gfX72dcbftJiT9jh3/QxSSyV9CVVWGK6O49XWgWbM=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpPyL4g0KSITKL2rS/5/JUGlRc0/0kct1Ly8r76
 O/focbcIhKJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaT8i+AAKCRAbX0TJAJUV
 VgeiD/0S9x5IrcKnYoesWTiAUaF0m2f+l8iEmOC6z6Xv1f+57t6mjtVmyzM+X1uShWgTptrYd5v
 Vzj+tCTqwlkCPkGeiK+8xIkwPJoDFM6+CCSUb9Z5rs7zZgZM5N/46ubwCAVt3W/GJUB5iPyXqfe
 1PzK1RfaBq6e6z1TK2iWelb7k/QeZxg1tBglFwjU7LFFEYIvYp6fGmB5BYOsgTzZ55E0aEGLnsV
 mtCyQnwDaSep11n/+kSqHqGnRMOn0pWuG4JZh33fBmjYN/h088YR1CGTub2wPl1c8TaN6Z2X9ni
 l+fUDgapQqW4vmpzDASabutLTfMEJQRC/jxw+voVFoF+ylAGLjIqac7l4REMkaCmnGb74INg2BV
 i35PMDjvqPpOlAnaUK8vFDRmb/9WOtqNNf0NNcNr5oMXVVrZhX4ecYkQoJk/DhONnOJ8/HEZeis
 M3k4WugytcE65W+S1LxTTQZHUkoz5sEVb0vK45ko+LV1BZmgkWqhm9jgYbHEjTayNgMdrYQkSiz
 MeHSkoAkcAI2TGWmUg4LtG4HV4rtiI8a3YNt4N9KRFMI6v7tGC1cltPSnLCBTFDeBV02ealnnei
 dH+4wJFkyJIfWqhiulu81bpudVkMVpsBrxafgzrw3UB84Z4GVjTyAd3WwHs8PzUDhlBiAFH3UEC
 0P+AugGQcVfwFpQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE0MDE5MyBTYWx0ZWRfX/7k8ZjJp1n9c
 CwiJFkRf7vj6akqVj88YoSRQE1OYLMXJK0P2hLChJTatlVTSz0xud4t1tr31Qjg/htMOmxQixhw
 9Vl6zGuPslou6uy3yNXfvC3JJqV9C9YDLJ85fB9kDmM5R+2MWS5WAQGo1Mz/aUtd7y4/jVzQyTq
 WqT1+fPHivODsFaeqnCabZgBSObBuSB0pV6pvrDtW2FUew9aJbSjLHdhvPcP3Rjqmqv0D4bkk6+
 juT/+EuVYLybO1r1l5zovC8tf5IhaOGVBLb4FiMANorWC/GNS8HX7pi9g7xySDnhSm8YWJA7g2j
 YN/1qm44Y2/tnvc9UZB5lwiuOwQJ4pashvDz+QlIDnZSDqqrewSEQf3zD/BHii7qJYEHCn11S7y
 AjIa1Y31nH3WiefiNdjtDa3kQgZyhQ==
X-Proofpoint-GUID: RDjQ2MgU4QW7oUjgINDB-q1VeBLwC4HN
X-Authority-Analysis: v=2.4 cv=E6nAZKdl c=1 sm=1 tr=0 ts=693f2303 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=DdBtMnqNxkYIvXj6ev4VzQ==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=hl1-wkGA7n6pOO7jiTgA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: RDjQ2MgU4QW7oUjgINDB-q1VeBLwC4HN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-14_06,2025-12-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 adultscore=0 clxscore=1011 spamscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512140193

On X1E80100 platforms, in EL2, the APSS watchdog is accessible.
The APSS WDT HW is compatible with the one from SC8280XP, SM8250 and the
like. So describe it in the EL2 overlay and document its compatible.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Abel Vesa (2):
      dt-bindings: watchdog: Document X1E80100 compatible
      arm64: dts: qcom: x1-el2: Add the APSS watchdog

 Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml |  1 +
 arch/arm64/boot/dts/qcom/x1-el2.dtso                     | 16 ++++++++++++++++
 2 files changed, 17 insertions(+)
---
base-commit: d9771d0dbe18dd643760431870a6abf9b0866bb0
change-id: 20251214-arm64-dts-qcom-x1e80100-el2-add-apss-wdt-e04ca6c99f0f

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>


