Return-Path: <linux-watchdog+bounces-4034-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FB47B2FFCB
	for <lists+linux-watchdog@lfdr.de>; Thu, 21 Aug 2025 18:17:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 28E0256345A
	for <lists+linux-watchdog@lfdr.de>; Thu, 21 Aug 2025 16:12:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E85C72D027F;
	Thu, 21 Aug 2025 16:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GNkjCTTk"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA7C6288C12;
	Thu, 21 Aug 2025 16:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755792774; cv=none; b=VvG725D96NhFnJGfbQKQIg0p7s/baddmDPu+kg8Ag4FC+u2W2vhOmwEcKZBFN0vy8b0R+GghKtW6Bee4LZ/bt2DH3SRPWiqoZPkyBVsRQt3Na3LC/hC5hk+105L0+Hw13TVVpb3DO+9q+Prii2avqqBtzKJytWCu8xnhi3JPHJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755792774; c=relaxed/simple;
	bh=MR+7f396WrEbtGRfUw87oG8dHsGs9G0ZUbfzqDxjrJ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lg7/92UFFUmVxNfh/yL/9kr6z7wzCMZH6Ay2vl68LnyK5Cjk9fpNyJCuXyx64YFApkqlsVTNGNp4lakFdc27WFE1o+18NAlvwqU6Q0nl6PNb8EsmvPEtLUHwZaTU26VhCYpMFSxi6iQ++5+T+yQkc6TnxBOzmE+WBTA/KO4vzNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GNkjCTTk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42AD8C4CEEB;
	Thu, 21 Aug 2025 16:12:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755792774;
	bh=MR+7f396WrEbtGRfUw87oG8dHsGs9G0ZUbfzqDxjrJ4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GNkjCTTkFAfE89O7CSkd8OPIM+LP6OHO/fGvcWd2Vx8ep5+8HTwEZA3C/JoRsZsq9
	 /cDw4G9Bp1nXa1Zh+A60Ll+Q4TJn8rGPwtmqJOJFfsC+wVO7MP4ad+FY7oazJZg/Sv
	 mmLsjkBDJZdPvm9BmMiAMf/60Wdf3v1HdEoOYDQKBp3gObAEcJdDHmsZi+OltD5T6l
	 kvu7Ay1cLDJKF7ssNzbHDIB3Lp2DgNDeFIVeFA0rQvUFDeAzawwAKYAqU7VFo0iUVc
	 4Rl75VNfxDt+KF8hWOO42gBFY05z71B4X5rqZafOnf8NHKQ8BdBEkdVIOVBAgNWr99
	 RyVxSccqkbYBg==
Date: Thu, 21 Aug 2025 23:55:38 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-watchdog@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: timer: Add ARM SSE(Subsystems for
 Embedded) timer
Message-ID: <aKdBejl-aC4uNjh8@xhacker>
References: <20250821152429.26995-1-jszhang@kernel.org>
 <20250821152429.26995-2-jszhang@kernel.org>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250821152429.26995-2-jszhang@kernel.org>

On Thu, Aug 21, 2025 at 11:24:28PM +0800, Jisheng Zhang wrote:
> Add binding doc for the ARM SSE(Subsystems for Embedded) timer. Here
> is the document URL:
> https://developer.arm.com/documentation/107610/0000/System-timer-components?lang=en
> 
> Although the IP is mostly seen on MCU SoC platforms, but nothing
> prevent it from being integrated into linux capable SoC platforms.
> 
> The IP core may have a system counter to generate timestamp value,
> a system timer to raise an interrupt when a period has elapsed, and
> a System Watchdog to detect errant system behaviour then reset the
> system if a period elapses without ping.
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  .../bindings/timer/arm,sse_timer.yaml         | 90 +++++++++++++++++++
>  1 file changed, 90 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/timer/arm,sse_timer.yaml
> 
> diff --git a/Documentation/devicetree/bindings/timer/arm,sse_timer.yaml b/Documentation/devicetree/bindings/timer/arm,sse_timer.yaml
> new file mode 100644
> index 000000000000..37a79f9052d0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/timer/arm,sse_timer.yaml
> @@ -0,0 +1,90 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/timer/arm,sse_timer.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ARM SSE(Subsystems for Embedded) system timer
> +
> +maintainers:
> +  - Jisheng Zhang <jszhang@kernel.org>
> +
> +description: |+
> +  ARM SSE(Subsystems for Embedded) system timer core may have a system counter
> +  to generate timestamp value, a system timer to raise an interrupt when a
> +  period has elapsed, and a System Watchdog to detect errant system behaviour
> +  then reset the system if a period elapses without ping.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - arm,sse-timer
> +
> +  reg:
> +    maxItems: 1
> +    description: The system counter control frame base
> +
> +  clocks:
> +    maxItems: 1
> +
> +  '#address-cells':
> +    enum: [1, 2]
> +
> +  '#size-cells':
> +    const: 1
> +
> +  ranges: true
> +
> +patternProperties:
> +  '^frame@[0-9a-f]+$':
> +    type: object
> +    additionalProperties: false
> +    description: A timer node has some frame sub-nodes, each frame can be timer frame or watchdog frame. Each frame has the following properties.
> +    properties:
> +      interrupts:
> +        minItems: 1
> +        items:
> +          - description: timer irq
> +
> +      reg:
> +        minItems: 1
> +        items:
> +          - description: 1st view base address
> +          - description: 2nd optional view base address if this is a watchdog frame
> +
> +    required:
> +      - interrupts
> +      - reg
> +
> +required:
> +  - compatible
> +  - reg
> +  - '#address-cells'
> +  - '#size-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    timer@f7f3e000 {
> +      compatible = "arm,sse-timer";
> +      #address-cells = <1>;
> +      #size-cells = <1>;
> +      ranges;
> +      reg = <0xf7f3e000 0x2000>;
> +      clocks = <&core_clk>;
> +
> +      frame@f7f20000 {
> +        reg = <0xf7f20000 0x1000>;
> +        interrupts = <0 26 0x8>;
> +      };
> +
> +      frame@f7f30000 {
> +        interrupts = <0 15 0x8>;
> +        reg = <0xf7f32000 0x1000>,
> +              <0xf7f33000 0x1000>;
> +      };
> +    };
> +
> +...
> -- 
> 2.50.1
> 

